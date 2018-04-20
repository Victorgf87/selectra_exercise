require 'test_helper'

class LoginIntegrationTest < ActionDispatch::IntegrationTest
  test "login correct" do
    get root_path
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "Log in"

    #Simulate login
    user = User.create(email: "#{rand(50000)}@example.com",
                       password: 'password')
    post user_session_path, params: { 'user[email]': user.email, 'user[password]': 'password' }

    assert_response :redirect
    follow_redirect!
    assert_response :success


  end
end
