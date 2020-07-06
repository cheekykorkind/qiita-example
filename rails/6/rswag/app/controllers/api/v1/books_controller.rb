# class Api::V1::BooksController < Api::V1::ApiController
class Api::V1::BooksController < ActionController::Base
  
    protect_from_forgery

    before_action :set_tmp

    # GETメソッド使う
    def index
      @tmp[:action] = "indexxx"
      render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
    end

    # POSTメソッド使う
    def create
      @tmp[:action] = "createee"
      render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
    end

    private

    def set_tmp
      @tmp = {
        action: 'value of action',
        value: 11
      }
    end
end