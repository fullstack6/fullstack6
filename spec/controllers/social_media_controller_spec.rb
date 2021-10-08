# frozen_string_literal: true

require 'rails_helper'

describe SocialMediaController, type: :controller do
  let(:proper_data) do
    {
      twitter: %w[tweet],
      facebook: %w[fb-status],
      instagram: %w[insta-picture]
    }
  end

  let(:error_data) do
    {
      twitter: %w[tweet],
      facebook: %w[fb-status],
      instagram: 'response 500'
    }
  end

  describe 'GET index' do
    context 'when result is success' do
      before do
        allow(SocialMediaService)
          .to receive(:call).with(:facebook, 'status').and_return(proper_result[:facebook])
        allow(SocialMediaService)
          .to receive(:call).with(:twitter, 'tweet').and_return(proper_result[:twitter])
        allow(SocialMediaService)
          .to receive(:call).with(:instagram, 'picture').and_return(proper_result[:instagram])
        get :index
      end

      context 'when data is getting proper' do
        let(:proper_result) { proper_data }

        it 'returns response without error' do
          expect(response.body).to eq proper_data.to_json
        end

        it 'responds with 200' do
          expect(response.code).to eq '200'
        end
      end

      context 'when error in data' do
        let(:proper_result) { error_data }

        it 'returns response with error' do
          expect(response.body).to eq error_data.to_json
        end

        it 'responds with 200' do
          expect(response.code).to eq '200'
        end
      end
    end
  end
end
