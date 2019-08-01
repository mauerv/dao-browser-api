require 'test_helper'

class BlockchainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blockchain = blockchains(:one)
  end

  test "should get index" do
    get blockchains_url, as: :json
    assert_response :success
  end

  test "should create blockchain" do
    assert_difference('Blockchain.count') do
      post blockchains_url, params: { blockchain: { name: @blockchain.name } }, as: :json
    end

    assert_response 201
  end

  test "should show blockchain" do
    get blockchain_url(@blockchain), as: :json
    assert_response :success
  end

  test "should update blockchain" do
    patch blockchain_url(@blockchain), params: { blockchain: { name: @blockchain.name } }, as: :json
    assert_response 200
  end

  test "should destroy blockchain" do
    assert_difference('Blockchain.count', -1) do
      delete blockchain_url(@blockchain), as: :json
    end

    assert_response 204
  end
end
