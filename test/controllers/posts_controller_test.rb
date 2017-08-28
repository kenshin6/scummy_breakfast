require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:shimo)
  end

  test "should redirect for not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "Hey hey hey" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:john))
    post = posts(:bugs)
    puts post.id
    assert_no_difference 'Post.count' do
      delete post_path(post)
    end
    assert_redirected_to root_url
  end
end
