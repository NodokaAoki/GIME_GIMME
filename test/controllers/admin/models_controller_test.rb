require 'test_helper'

class Admin::ModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_models_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_models_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_models_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_models_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_models_destroy_url
    assert_response :success
  end

end
