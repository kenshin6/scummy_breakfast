require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "A blog about coding, climbing, and Japan."
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Coding, climbing, thoughts, and insights from the heart of Japan."
  end
end
