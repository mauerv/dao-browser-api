require 'test_helper'

class AuditorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auditor = auditors(:one)
  end

  test "should get index" do
    get auditors_url, as: :json
    assert_response :success
  end

  test "should create auditor" do
    assert_difference('Auditor.count') do
      post auditors_url, params: { auditor: { name: @auditor.name, website: @auditor.website } }, as: :json
    end

    assert_response 201
  end

  test "should show auditor" do
    get auditor_url(@auditor), as: :json
    assert_response :success
  end

  test "should update auditor" do
    patch auditor_url(@auditor), params: { auditor: { name: @auditor.name, website: @auditor.website } }, as: :json
    assert_response 200
  end

  test "should destroy auditor" do
    assert_difference('Auditor.count', -1) do
      delete auditor_url(@auditor), as: :json
    end

    assert_response 204
  end
end
