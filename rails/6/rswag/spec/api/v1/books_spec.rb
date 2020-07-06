require 'swagger_helper'

RSpec.describe Api::V1, type: :request do
  it 'GETテスト' do
    get "/api/v1/books"
    expect(response.body).to eq(
      {
        status: "SUCCESS",
        message: "It is for you",
        data: {
          action: "indexxx",
          value: 11
        }
      }.to_json
    )
  end
end