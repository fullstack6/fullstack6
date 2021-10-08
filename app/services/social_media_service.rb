# frozen_string_literal: true

# SocialMediaService
class SocialMediaService
  attr_reader :social_platform, :social_field

  def initialize(social_platform, social_field)
    @social_platform = social_platform
    @social_field = social_field
  end

  def self.call(*args, &block)
    new(*args, &block).call
  end

  def call
    api_url = "#{ENV['BASE_URL']}/#{social_platform}"
    response = HTTParty.get(api_url, { timeout: 15 })
    process(response)
  rescue Timeout::Error
    'Server is not responding'
  end

  def process(response)
    case response.code
    when 200
      success(response)
    when 404
      "response #{response.code}"
    when 500...600
      "response #{response.code}"
    else
      'Something went wrong, please try again'
    end
  end

  def success(response)
    JSON.parse(response.body).pluck(social_field)
  end
end
