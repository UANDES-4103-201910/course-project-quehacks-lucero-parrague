require 'test_helper'

class SharedpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sharedpost = sharedposts(:one)
  end

  test "should get index" do
    get sharedposts_url
    assert_response :success
  end

  test "should get new" do
    get new_sharedpost_url
    assert_response :success
  end

  test "should create sharedpost" do
    assert_difference('Sharedpost.count') do
      post sharedposts_url, params: { sharedpost: { date_of_sharing: @sharedpost.date_of_sharing, posts_id: @sharedpost.posts_id, user_id: @sharedpost.user_id } }
    end

    assert_redirected_to sharedpost_url(Sharedpost.last)
  end

  test "should show sharedpost" do
    get sharedpost_url(@sharedpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_sharedpost_url(@sharedpost)
    assert_response :success
  end

  test "should update sharedpost" do
    patch sharedpost_url(@sharedpost), params: { sharedpost: { date_of_sharing: @sharedpost.date_of_sharing, posts_id: @sharedpost.posts_id, user_id: @sharedpost.user_id } }
    assert_redirected_to sharedpost_url(@sharedpost)
  end

  test "should destroy sharedpost" do
    assert_difference('Sharedpost.count', -1) do
      delete sharedpost_url(@sharedpost)
    end

    assert_redirected_to sharedposts_url
  end
end
