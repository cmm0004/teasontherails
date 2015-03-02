require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Teas on the Loose"

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
  
  test "should get ourTea" do
    get :ourTea
    assert_response :success
    assert_select "title", "Our Tea | Teas on the Loose"
  end
  
    test "should get terms" do
    get :terms
    assert_response :success
    assert_select "title", "Terms and Conditions | Teas on the Loose"
  end

   test "should get subscribe" do
    get :subscribe
    assert_response :success
    assert_select "title", "Subscribe | Teas on the Loose"
  end
  
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Teas on the Loose"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Teas on the Loose"
  end
end
