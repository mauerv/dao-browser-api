require 'json_web_token'

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!, only: [:create, :destroy, :update, :remove_tag_from_dao, :add_tag_to_dao, :remove_contributor_from_dao, :add_contributor_to_dao]
  end

  SCOPES = {
    '/private' => nil,
    '/private-scoped' => ['read:messages']
  }

  private

  def authenticate_request!
    @auth_payload, @auth_header = auth_token

    render json: { errors: ['Insufficient scope'] }, status: :unauthorized unless scope_included
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def scope_included
    if SCOPES[request.env['PATH_INFO']] == nil
      true
    else
      (String(@auth_payload['scope']).split(' ') & (SCOPES[request.env['PATH_INFO']])).any?
    end
  end

  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end
end
