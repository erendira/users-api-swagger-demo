class ApidocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Users demo API'
      key :description, 'A sample users CRUD API'
      contact do
        key :name, 'https://github.com/erendira'
      end
    end
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
      UsersController,
      self,
  ].freeze

  def index
=begin
    swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    File.open(File.join(Rails.root, 'lib', 'swagger', 'swagger_v1.json'), 'w') { |file| file.write(swagger_data.to_json) }
=end
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
