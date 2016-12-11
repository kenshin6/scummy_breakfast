require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "A blog about coding, climbing, and living in Japan."
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Contact me!"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "Coder, climber, ex-pat in Japan."
  end
end
