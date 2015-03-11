require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
    
    def setup
    @user = users(:candice)
    remember(@user)
    end
    
    
    test "get_current_user gets correct user when session is nil" do
        assert_equal @user, get_current_user
        assert is_fixed_user_logged_in?
    end
    
    test "get_current_user returns nil when remember_digest is wrong" do 
        @user.update_attribute(:remember_digest, User.digest(User.new_token))  
        assert_nil get_current_user
    end
end
