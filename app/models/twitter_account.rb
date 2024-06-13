require "x"


class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  validates :username, uniqueness: true

  def client
    x_credentials = {
    api_key: Rails.application.credentials.dig(:twitter, :api_key),
    api_key_secret: Rails.application.credentials.dig(:twitter, :api_secret),
    access_token: token,
    access_token_secret: secret,
    }
    X::Client.new(**x_credentials)
  end

end
