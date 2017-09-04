#spec/requests/roles_spec.rb
require 'rails_helper'

RSpec.describe 'Roles API', type: :request do
  # initialize test data
  let!(:roles) { create_list(:role, 10) }
  let(:id) { roles.first.id }

  # Test suite for GET /roles
  describe 'GET /roles' do
    # make HTTP get request before each example
    before { get '/roles' }

    it 'returns roles' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

 # Test suite for GET /roles/:id
  describe 'GET /roles/:id' do
    before { get "/roles/#{id}" }

    context 'when the record exists' do
      it 'returns the role' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Role/)
      end
    end
  end

  # Test suite for POST /roles
  describe 'POST /roles' do
    # valid payload
    let(:valid_attributes) { { title: 'User'} }

    context 'when the request is valid' do
      before { post '/roles', params: valid_attributes }

      it 'creates a role' do
        expect(json['title']).to eq('User')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post '/roles', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /roles/:id
  describe 'PUT /roles/:id' do
    let(:valid_attributes) { { title: 'Admin' } }

    context 'when the record exists' do
      before { put "/roles/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /roles/:id
  describe 'DELETE /roles/:id' do
    before { delete "/roles/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
