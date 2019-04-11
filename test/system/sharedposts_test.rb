require "application_system_test_case"

class SharedpostsTest < ApplicationSystemTestCase
  setup do
    @sharedpost = sharedposts(:one)
  end

  test "visiting the index" do
    visit sharedposts_url
    assert_selector "h1", text: "Sharedposts"
  end

  test "creating a Sharedpost" do
    visit sharedposts_url
    click_on "New Sharedpost"

    fill_in "Date of sharing", with: @sharedpost.date_of_sharing
    fill_in "Posts", with: @sharedpost.posts_id
    fill_in "User", with: @sharedpost.user_id
    click_on "Create Sharedpost"

    assert_text "Sharedpost was successfully created"
    click_on "Back"
  end

  test "updating a Sharedpost" do
    visit sharedposts_url
    click_on "Edit", match: :first

    fill_in "Date of sharing", with: @sharedpost.date_of_sharing
    fill_in "Posts", with: @sharedpost.posts_id
    fill_in "User", with: @sharedpost.user_id
    click_on "Update Sharedpost"

    assert_text "Sharedpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Sharedpost" do
    visit sharedposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sharedpost was successfully destroyed"
  end
end
