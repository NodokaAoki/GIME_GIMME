require 'test_helper'

class Admin::CommentReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_comment_reports_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_comment_reports_update_url
    assert_response :success
  end

  test "should get index" do
    get admin_comment_reports_index_url
    assert_response :success
  end

end
