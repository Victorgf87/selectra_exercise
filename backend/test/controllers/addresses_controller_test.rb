require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "home with registered user" do
    sign_in users(:one)
    get root_path
    assert_response :success
  end

  test "home without registered user" do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test "User should not be able to edit an address that doesn't own" do
    sign_in users(:two)
    get edit_address_path(addresses(:of_one))
    assert_redirected_to root_path
  end

  test "User should be able to edit their own address" do
    sign_in users(:one)
    get edit_address_path(addresses(:of_one))
    assert_response :success
  end

  # TODO: Create similar tests in  remaining actions
  # TODO: Test API
end
