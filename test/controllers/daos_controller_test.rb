require 'test_helper'

class DaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dao = daos(:one)
  end

  test "should get index" do
    get daos_url, as: :json
    assert_response :success
  end

  test "should create dao" do
    assert_difference('Dao.count') do
      post daos_url, params: { dao: { contract_proof: @dao.contract_proof, description: @dao.description, discord: @dao.discord, github: @dao.github, mail: @dao.mail, medium: @dao.medium, name: @dao.name, reddit: @dao.reddit, subtitle: @dao.subtitle, telegram: @dao.telegram, twitter: @dao.twitter, website: @dao.website } }, as: :json
    end

    assert_response 201
  end

  test "should show dao" do
    get dao_url(@dao), as: :json
    assert_response :success
  end

  test "should update dao" do
    patch dao_url(@dao), params: { dao: { contract_proof: @dao.contract_proof, description: @dao.description, discord: @dao.discord, github: @dao.github, mail: @dao.mail, medium: @dao.medium, name: @dao.name, reddit: @dao.reddit, subtitle: @dao.subtitle, telegram: @dao.telegram, twitter: @dao.twitter, website: @dao.website } }, as: :json
    assert_response 200
  end

  test "should destroy dao" do
    assert_difference('Dao.count', -1) do
      delete dao_url(@dao), as: :json
    end

    assert_response 204
  end
end
