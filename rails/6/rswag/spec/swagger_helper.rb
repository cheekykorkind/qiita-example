# frozen_string_literal: true

# require 'rails_helper'

# RSpec.configure do |config|
#   # Specify a root folder where Swagger JSON files are generated
#   # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
#   # to ensure that it's configured to serve Swagger from the same folder
#   config.swagger_root = Rails.root.join('swagger').to_s

#   # Define one or more Swagger documents and provide global metadata for each one
#   # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
#   # be generated at the provided relative path under swagger_root
#   # By default, the operations defined in spec files are added to the first
#   # document below. You can override this behavior by adding a swagger_doc tag to the
#   # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
#   config.swagger_docs = {
#     'v1/swagger.yaml' => {
#       json
#       openapi: '3.0.1',
#       info: {
#         title: 'API V1',
#         version: 'v1'
#       },
#       paths: {},
#       servers: [
#         {
#           url: 'https://{defaultHost}',
#           variables: {
#             defaultHost: {
#               default: 'www.example.com'
#             }
#           }
#         }
#       ]
#     }
#   }

#   # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
#   # The swagger_docs configuration option has the filename including format in
#   # the key, this may want to be changed to avoid putting yaml in json files.
#   # Defaults to json. Accepts ':json' and ':yaml'.
#   config.swagger_format = :yaml
# end

######################################
# 上は「RAILS_ENV=test bundle exec rails g rswag:specs:install」で生成されました
######################################

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'
  config.swagger_docs = {
    'v1/swagger.json' => {
      "swagger": "2.0",
      "info": {
        "title": "API V1 (en)",
        "version": "v1"
      },
      "securityDefinitions": {
        "token": {
          "type": "apiKey",
          "name": "Authorization",
          "in": "header"
        }
      },
      "basePath": "/api/v1",
      "paths": {
        "/books": {
          "get": {
            "summary": "Book list",
            "tags": [
              "Book list Group"
            ],
            "produces": [
              "application/json"
            ],
            "security": [
              {
                "token": [
    
                ]
              }
            ],
            "responses": {
              "200": {
                "description": "On Success",
                "schema": {
                  "type": "object",
                  "properties": {
                    "status": {
                      "type": "string"
                    },
                    "message": {
                      "type": "string"
                    }
                  },
                  "required": [
                    "status",
                    "message"
                  ]
                }
              }
            }
          }
        },
    
        "/books/create": {
          "post": {
            "summary": "Create Book",
            "tags": [
              "Book Create Group"
            ],
            "produces": [
              "application/json"
            ],
            "consumes": [
              "application/json"
            ],
            "security": [
              {
                "token": [
    
                ]
              }
            ],
            "parameters": [
              {
                "examples": {
                  "application/json": {
                    "name": "myNewBook",
                    "description": "It will be awesome book"
                  }
                },
                "name": "contents",
                "in": "body",
                "schema": {
                  "type": "object",
                  "properties": {
                    "name": {
                      "type": "string"
                    },
                    "description": {
                      "type": "string"
                    }
                  },
                  "required": [
                    "name",
                    "description"
                  ]
                },
                "required": true,
                "description": "Will create book"
              }
            ],
            "responses": {
              "400": {
                "description": "On Not Found",
                "examples": {
                  "application/json": {
                    "status": "OPERATION FAIL",
                    "message": "something wrong"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "status": {
                      "type": "string"
                    },
                    "message": {
                      "type": "string"
                    }
                  },
                  "required": [
                    "status",
                    "message"
                  ]
                }
              },
              "200": {
                "description": "On Success",
                "schema": {
                  "type": "object",
                  "properties": {
                    "status": {
                      "type": "string"
                    },
                    "message": {
                      "type": "string"
                    },
                    "data": {
                      "type": "object",
                      "properties": {
                        "action": {
                          "type": "string"
                        },
                        "value": {
                          "type": "string"
                        }
                      },
                      "required": [
                        "action",
                        "value"
                      ]
                    }
                  },
                  "required": [
                    "status",
                    "message",
                    "data"
                  ]
                },
                "examples": {
                  "application/json": {
                    "status": "SUCCESS",
                    "message": "It is for you",
                    "data": {
                      "action": "create",
                      "value": 11
                    }
                  }
                }
              }
            }
          }
        }
      }
    } 
  }
end
