require 'rails_helper'

RSpec.describe 'Content API', type: :request do
  let(:url) { '/api/v1/contents' }
  # initialize test data
  let!(:contents) { create_list(:content, 10) }
  let(:content_id) { contents.first.id }

  # Test suite for GET /contents
  describe "GET /contents" do
    # make HTTP get request before each example
    before { get url }

    it 'returns contents' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /contents/:id
  describe 'GET /contents/:id' do
    before { get "#{url}/#{content_id}"}

    context 'when the record exists' do
      it 'returns the content' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(content_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:content_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Content/)
      end
    end
  end

  describe 'POST /contents' do
    # valid payload
    let(:valid_attributes) { {
      title: 'John Wick',
      description: 'John Wick (born Jardani Jovonovich in Belarus) is played by Keanu Reeves.'
    } }

    context 'when the request is valid' do
      before { post url, params: valid_attributes }

      it 'creates a content' do
        expect(json['title']).to eq('John Wick')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post url, params: { title: 'John Wick: Chapter 2' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Description can't be blank/)
      end
    end
  end

  # Test suite for PUT /contents/:id
  describe 'PUT /contents/:id' do
    let(:valid_attributes) { { title: 'Harry Potter' } }

    context 'when the record exists' do
      before { put "#{url}/#{content_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE '/contents/:id'
  describe 'DELETE /contents/:id' do
    before { delete "#{url}/#{content_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end