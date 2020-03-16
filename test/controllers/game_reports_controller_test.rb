require 'test_helper'

class GameReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get game_reports_create_url
    assert_response :success
  end

end
