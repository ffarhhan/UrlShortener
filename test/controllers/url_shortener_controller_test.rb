require 'test_helper'

class UrlShortenerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get url_shortener_new_url
    assert_response :success
  end

  test "should get edit" do
    get url_shortener_edit_url
    assert_response :success
  end

  test "should get show" do
    get url_shortener_show_url
    assert_response :success
  end

end
