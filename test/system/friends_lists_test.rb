require "application_system_test_case"

class FriendsListsTest < ApplicationSystemTestCase
  setup do
    @friends_list = friends_lists(:one)
  end

  test "visiting the index" do
    visit friends_lists_url
    assert_selector "h1", text: "Friends lists"
  end

  test "should create friends list" do
    visit friends_lists_url
    click_on "New friends list"

    fill_in "About", with: @friends_list.about
    fill_in "Email", with: @friends_list.email
    fill_in "Full name", with: @friends_list.full_name
    fill_in "Phone", with: @friends_list.phone
    fill_in "Twitter", with: @friends_list.twitter
    click_on "Create Friends list"

    assert_text "Friends list was successfully created"
    click_on "Back"
  end

  test "should update Friends list" do
    visit friends_list_url(@friends_list)
    click_on "Edit this friends list", match: :first

    fill_in "About", with: @friends_list.about
    fill_in "Email", with: @friends_list.email
    fill_in "Full name", with: @friends_list.full_name
    fill_in "Phone", with: @friends_list.phone
    fill_in "Twitter", with: @friends_list.twitter
    click_on "Update Friends list"

    assert_text "Friends list was successfully updated"
    click_on "Back"
  end

  test "should destroy Friends list" do
    visit friends_list_url(@friends_list)
    click_on "Destroy this friends list", match: :first

    assert_text "Friends list was successfully destroyed"
  end
end
