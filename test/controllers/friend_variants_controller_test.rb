require "test_helper"

class FriendVariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_variant = friend_variants(:one)
  end

  test "should get index" do
    get friend_variants_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_variant_url
    assert_response :success
  end

  test "should create friend_variant" do
    assert_difference('FriendVariant.count') do
      post friend_variants_url, params: { friend_variant: { friends_id: @friend_variant.friends_id, phone2: @friend_variant.phone2 } }
    end

    assert_redirected_to friend_variant_url(FriendVariant.last)
  end

  test "should show friend_variant" do
    get friend_variant_url(@friend_variant)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_variant_url(@friend_variant)
    assert_response :success
  end

  test "should update friend_variant" do
    patch friend_variant_url(@friend_variant), params: { friend_variant: { friends_id: @friend_variant.friends_id, phone2: @friend_variant.phone2 } }
    assert_redirected_to friend_variant_url(@friend_variant)
  end

  test "should destroy friend_variant" do
    assert_difference('FriendVariant.count', -1) do
      delete friend_variant_url(@friend_variant)
    end

    assert_redirected_to friend_variants_url
  end
end
