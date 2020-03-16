require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get edit" do
    get games_edit_url
    assert_response :success
  end

  test "should get update" do
    get games_update_url
    assert_response :success
  end

  test "should get delete_game" do
    get games_delete_game_url
    assert_response :success
  end

  test "should get hidden" do
    get games_hidden_url
    assert_response :success
  end

end
