require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:candice)
  end
  
  test "unsuccessful edit user not logged in" do
    get edit_user_path(@user)
    follow_redirect!
    assert_template 'sessions/new'
  end
  
  test "unsuccessful edit invalid information" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_fixed_user_logged_in?
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: '',
                                    email: 'candice.com',
                                    password: 'foo',
                                    password_confirmation: 'bar' }
    assert_template 'users/edit'
    assert_template 'shared/_error_messages'
  end
  
  test "successful edit" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_fixed_user_logged_in?
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: {name: name,
                                    email: email,
                                    password: 'password',
                                    password_confirmation: 'password' }
                                    
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name,  name
    assert_equal @user.email, email
  end
    
  
end
