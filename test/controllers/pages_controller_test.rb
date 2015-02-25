require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Teas on the Loose"

  end

  test "should get thankyou" do
    get :thankyou
    assert_response :success
    assert_select "title", "Thank You | Teas on the Loose"
  end

  test "should get cancel" do
    get :cancel
    assert_response :success
    assert_select "title", "Cancel | Teas on the Loose"
  end

  test "should get faq" do
    get :faq
    assert_response :success
    assert_select "title", "FAQ | Teas on the Loose"
  end

  test "should get privacypolicy" do
    get :privacypolicy
    assert_response :success
    assert_select "title", "Privacy Policy | Teas on the Loose"
  end

end
