require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid sign-up info does not make a new user" do
  get signup_path
  assert_no_difference 'User.count' do
    post users_path, user: {name:'Candice',
                            email:'cmm0004@test.com',
                            password:'foo',
                            password_confirmation:'baz'
    }
  end
  assert_template 'users/new'
  assert_template 'shared/_error_messages'
  end
  
  
  test 'valid user signup' do
  get signup_path
  assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: {name: 'Candice',
                                          email:'cmm0004@candice.com',
                                          password:'foobar',
                                          password_confirmation:'foobar'
    }
    end
  assert_template 'users/show'
  assert_not flash.empty?
  get root_path
  assert flash.empty?
  assert is_fixed_user_logged_in?
  
 
  end
  
  
end
