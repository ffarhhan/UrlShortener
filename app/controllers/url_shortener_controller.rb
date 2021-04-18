class UrlShortenerController < ApplicationController
  def new
  end

  def create
    @url = Url.create(url_params)
    render json: {sucess: true, data: @url }
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def url_params
    # params.require(:url).permit(:url)
  end
end
