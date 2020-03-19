require 'test_helper'

class Admin::WarningMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_warning_mails_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_warning_mails_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_warning_mails_show_url
    assert_response :success
  end

end
