class UrlShortenerController < ApplicationController
  def new
  end

  def create
    new_url = Url.new(url_params)
    host = "http://localhost:3000"
    begin
      shorten_key = Shortener::ShortenedUrl.generate(new_url.url).unique_key
      shorten_url = "#{host}/#{shorten_key}"
    rescue Exception => e
      puts e
    end
    new_url.shorten_url = shorten_url
    if new_url.save
      redirect_to url_shortener_show_path
    else
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
      redirect_to url, status: :moved_permanently
    else
      redirect_to root_url
    end
  end

  def edit
  end

  def show
    @urls = Url.all
  end

  def update
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end
end
