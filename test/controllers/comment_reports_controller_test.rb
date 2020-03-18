require 'test_helper'

class CommentReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get comment_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get comment_reports_create_url
    assert_response :success
  end

  test "should get show" do
    get comment_reports_show_url
    assert_response :success
  end

end
