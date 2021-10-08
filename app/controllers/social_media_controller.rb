# frozen_string_literal: true

# SocialMediaController
class SocialMediaController < ApplicationController
  def index
    social_data = {}
    SOCIAL_MEDIA.each do |social_platform, social_field|
      social_data[social_platform] = SocialMediaService.call(social_platform, social_field)
    end
    render json: social_data
  end
end
