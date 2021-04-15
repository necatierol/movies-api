require 'rails_helper'

RSpec.describe "Seasons API", type: :request do
  # Initialize the test data
  let!(:content) { create(:content) }
  let!(:seasons) { create_list(:season, 20, content_id: content.id) }
  let(:content_id) { content.id }
  let(:id) { seasons.first.id }
  let(:url) { "/contents/#{content_id}/seasons" }

  #Test suite for GET /contents/:content_id/seasons
  describe "GET /contents/:content_id/seasons" do
    before { get url }

    context 'when content exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all content seasons' do
        expect(json.size).to eq(20)
      end
    end

    context 'when content does not exist' do
      let(:content_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Content/)
      end
    end
  end

  # Test suite for GET /contents/:content_id/seasons/:id
  describe 'GET /contents/:content_id/seasons/:id' do
    before { get "#{url}/#{id}" }

    context 'when content season exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the season' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when content season does not exits' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Season/)
      end
    end
  end

  # Test suite for POST /contents/:content_id/seasons
  describe 'POST /contents/:content_id/seasons' do
    let(:valid_attributes) { { title: 'Season 1' } }

    context 'when the request is valid' do
      before { post url, params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post url, params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /contents/:content_id/seasons/:id
  describe 'PUT /contents/:content_id/seasons/:id' do
    let(:valid_attributes) { { title: 'Season 2' } }

    before { put "#{url}/#{id}", params: valid_attributes }

    context 'when season exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the season' do
        updated_season = Season.find(id)
        expect(updated_season.title).to match(/Season 2/)
      end
    end

    context 'when the season does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Season/)
      end
    end
  end

  # Test suite for DELETE /contents/:content_id/seasons/:id
  describe 'DELETE /contents/:content_id/seasons/:id' do
    before { delete "#{url}/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
