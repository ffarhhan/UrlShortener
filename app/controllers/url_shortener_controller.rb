class UrlShortenerController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @new_url = Url.new(url_params)
    host = Rails.env == "production" ? "https://aqueous-tor-85493.herokuapp.com" : "http://localhost:3000"
    begin
      shorten_key = Shortener::ShortenedUrl.generate(@new_url.url, expires_at: 30.days.since).unique_key
      shorten_url = "#{host}/#{shorten_key}"
    rescue Exception => e
      puts e
    end
    @new_url.shorten_url = shorten_url
    @new_url.uuid = shorten_key
    if @new_url.save
    else
      flash[:error] = 'Please enter valid URL'
      redirect_to root_url
    end
  end

  def redirect
    token = ::Shortener::ShortenedUrl.extract_token(params[:id])
    url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params)
    if url.present?
      url = url[:url]
      url.slice!(0)
      url = "https://" + url
      update_location_and_clicked(params[:id])
      redirect_to url, status: :moved_permanently
    else
      redirect_to root_url
    end
  end

  def show
    @urls = Url.all
  end

  private

  def update_location_and_clicked(uuid)
    @url = Url.find_by(uuid: uuid)
    @url.update(clicked: @url.clicked + 1)
    @url.addresses.create(ip_address: request.remote_ip,city: request.location.city  )
  end


  def url_params
    params.require(:url).permit(:url)
  end
end
