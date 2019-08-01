require 'test_helper'

class FrameworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @framework = frameworks(:one)
  end

  test "should get index" do
    get frameworks_url, as: :json
    assert_response :success
  end

  test "should create framework" do
    assert_difference('Framework.count') do
      post frameworks_url, params: { framework: { name: @framework.name } }, as: :json
    end

    assert_response 201
  end

  test "should show framework" do
    get framework_url(@framework), as: :json
    assert_response :success
  end

  test "should update framework" do
    patch framework_url(@framework), params: { framework: { name: @framework.name } }, as: :json
    assert_response 200
  end

  test "should destroy framework" do
    assert_difference('Framework.count', -1) do
      delete framework_url(@framework), as: :json
    end

    assert_response 204
  end
end
