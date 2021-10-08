# frozen_string_literal: true

require 'rails_helper'
describe SocialMediaService do
  let(:proper_result) do
    {
      twitter: %w[tweet],
      facebook: %w[fb-status],
      instagram: %w[insta-picture]
    }
  end

  describe 'get' do
    context 'when social media is instagram' do
      subject { described_class.call('instagram', 'picture') }
      let(:url) { "#{ENV['BASE_URL']}/instagram" }
      let(:instagram_body) { [{ name: 'xyz', picture: 'insta-picture' }] }
      let(:instagram_data) { { status: 200, body: instagram_body.to_json } }

      before do
        stub_request(:get, url).with(headers: { 'Accept' => '*/*' }).to_return(instagram_data)
      end

      it 'returns response' do
        expect(subject).to eq proper_result[:instagram]
      end
    end

    context 'when social media is twitter' do
      subject { described_class.call('twitter', 'tweet') }
      let(:url) { "#{ENV['BASE_URL']}/twitter" }
      let(:tweet_body) { [{ name: 'abc', tweet: 'tweet' }] }
      let(:tweet_data) { { status: 200, body: tweet_body.to_json } }

      before do
        stub_request(:get, url)
          .with(headers: { 'Accept' => '*/*' })
          .to_return(tweet_data)
      end

      it 'returns correct data in response' do
        expect(subject).to eq proper_result[:twitter]
      end
    end

    context 'when social media is facebook' do
      subject { described_class.call('facebook', 'status') }
      let(:url) { "#{ENV['BASE_URL']}/facebook" }
      let(:facebook_body) { [{ name: 'name1', status: 'fb-status' }] }
      let(:facebook_data) { { status: 200, body: facebook_body.to_json } }

      before do
        stub_request(:get, url).with(headers: { 'Accept' => '*/*' }).to_return(facebook_data)
      end

      it 'returns response' do
        expect(subject).to eq proper_result[:facebook]
      end
    end
  end
end
