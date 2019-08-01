require 'test_helper'

class ContributorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contributor = contributors(:one)
  end

  test "should get index" do
    get contributors_url, as: :json
    assert_response :success
  end

  test "should create contributor" do
    assert_difference('Contributor.count') do
      post contributors_url, params: { contributor: { name: @contributor.name, twitter: @contributor.twitter } }, as: :json
    end

    assert_response 201
  end

  test "should show contributor" do
    get contributor_url(@contributor), as: :json
    assert_response :success
  end

  test "should update contributor" do
    patch contributor_url(@contributor), params: { contributor: { name: @contributor.name, twitter: @contributor.twitter } }, as: :json
    assert_response 200
  end

  test "should destroy contributor" do
    assert_difference('Contributor.count', -1) do
      delete contributor_url(@contributor), as: :json
    end

    assert_response 204
  end
end
