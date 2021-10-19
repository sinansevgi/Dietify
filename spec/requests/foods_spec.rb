require 'rails_helper'

RSpec.describe "Foods", type: :request do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:meal) { create(:meal, user_id: user.id) }
  let!(:foods) { create_list(:food, 20, meal_id: meal.id) }
  let(:meal_id) { meal.id }
  let(:id) { foods.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /meals/:meal_id/foods
  describe 'GET /meals/:meal_id/foods' do
    before { get "/meals/#{meal_id}/foods", params: {}, headers: headers }
    context 'when meal exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all meal foods' do
        expect(json.size).to eq(20)
      end
    end

    context 'when meal does not exist' do
      let(:meal_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Meal/)
      end
    end
  end

  # Test suite for GET /meals/:meal_id/foods/:id
  describe 'GET /meals/:meal_id/foods/:id' do
    before { get "/meals/#{meal_id}/foods/#{id}", params: {}, headers: headers }

    context 'when meal food exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the food' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when meal food does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Food/)
      end
    end
  end

  # Test suite for PUT /meals/:meal_id/foods
  describe 'POST /meals/:meal_id/foods' do
    let(:valid_attributes) { { name: 'Fish sticks', calories: 111 }.to_json }

    context 'when request attributes are valid' do
      before { post "/meals/#{meal_id}/foods", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/meals/#{meal_id}/foods", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /meals/:meal_id/foods/:id
  describe 'PUT /meals/:meal_id/foods/:id' do
    let(:valid_attributes) { { name: 'Fish' }.to_json }

    before { put "/meals/#{meal_id}/foods/#{id}", params: valid_attributes, headers: headers }

    context 'when food exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the food' do
        updated_item = Food.find(id)
        expect(updated_item.name).to match(/Fish/)
      end
    end

    context 'when the food does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Food/)
      end
    end
  end

  # Test suite for DELETE /meals/:id
  describe 'DELETE /meals/:id' do
    before { delete "/meals/#{meal_id}/foods/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
