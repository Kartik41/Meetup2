require "application_system_test_case"

class FriendVariantsTest < ApplicationSystemTestCase
  setup do
    @friend_variant = friend_variants(:one)
  end

  test "visiting the index" do
    visit friend_variants_url
    assert_selector "h1", text: "Friend Variants"
  end

  test "creating a Friend variant" do
    visit friend_variants_url
    click_on "New Friend Variant"

    fill_in "Friends", with: @friend_variant.friends_id
    fill_in "Phone2", with: @friend_variant.phone2
    click_on "Create Friend variant"

    assert_text "Friend variant was successfully created"
    click_on "Back"
  end

  test "updating a Friend variant" do
    visit friend_variants_url
    click_on "Edit", match: :first

    fill_in "Friends", with: @friend_variant.friends_id
    fill_in "Phone2", with: @friend_variant.phone2
    click_on "Update Friend variant"

    assert_text "Friend variant was successfully updated"
    click_on "Back"
  end

  test "destroying a Friend variant" do
    visit friend_variants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friend variant was successfully destroyed"
  end
end
