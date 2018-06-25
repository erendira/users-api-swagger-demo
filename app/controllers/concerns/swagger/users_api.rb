module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      parameter name: :id do
        key :in, :path
        key :description, 'User ID'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      operation :get do
        key :description, 'Find a user by ID'
        key :operationId, :find_user_by_id
        key :tags, [:User]
        response 200 do
          key :description, 'User'
          schema do
            key :'$ref', :User
          end
        end
      end
      operation :put do
        key :description, 'Updates a User'
        key :operationId, :update_user
        key :produces, ['application/json']
        key :tags, [:User]
        parameter do
          key :name, :user
          key :in, :body
          key :description, 'User to update'
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end
        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :User
          end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
      operation :delete do
        key :description, 'deletes a user based on the ID supplied'
        key :operationId, :delete_user
        key :tags, [:User]
        response 204 do
          key :description, 'user deleted'
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end

    swagger_path '/users' do
      operation :get do
        key :description, 'get all the Users'
        key :operationId, :get_all_users
        key :produces, [
            'application/json'
        ]
        key :tags, [:User]
        response 200 do
          key :description, 'user response'
          schema do
            key :type, :array
            items do
              key :'$ref', :User
            end
          end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
      operation :post do
        key :description, 'Creates a new User'
        key :operationId, :add_user
        key :produces, [
            'application/json'
        ]
        key :tags, [
            :User
        ]
        parameter do
          key :name, :user
          key :in, :body
          key :description, 'User to add'
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end
        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :User
          end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end
  end
end