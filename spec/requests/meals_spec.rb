require 'rails_helper'

RSpec.describe "Meals", type: :request do
  let!(:meals) { create_list(:meal, 10) }
  let(:meal_id) { meals.first.id }

  # Test suite for GET /meals
  describe 'GET /meals' do
    # make HTTP get request before each example
    before { get '/meals' }

    it 'returns meals' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /meals/:id
  describe 'GET /meals/:id' do
    before { get "/meals/#{meal_id}" }

    context 'when the record exists' do
      it 'returns the meal' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(meal_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:meal_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Meal/)
      end
    end
  end

  # Test suite for POST /meals
  describe 'POST /meals' do
    # valid payload
    let(:valid_attributes) { { title: 'Breakfast', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/meals', params: valid_attributes }

      it 'creates a meal' do
        expect(json['title']).to eq('Breakfast')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/meals', params: { title: 'Dinner' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /meals/:id
  describe 'PUT /meals/:id' do
    let(:valid_attributes) { { title: 'Dinner' } }

    context 'when the record exists' do
      before { put "/meals/#{meal_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /meals/:id
  describe 'DELETE /meals/:id' do
    before { delete "/meals/#{meal_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
