class Api::V1::ReadmesController < ApplicationController


  resource_description do
    short "API for managing Readme"
  end

  api :GET, '/readmes', 'All readmes '
  description <<-EOS
    == Get Action Readmes
    Is used for show readmes
      Is used for get all readmes
        curl localhost:3000/api/v1/readmes
  EOS
  def index
    render json: Readme.all
  end

  api :GET, '/readmes/:id', 'Show readme'
  description <<-EOS
    == Show single readme
    Is used for show single readme
      curl -v localhost:3000/api/v1/readmes/1
  EOS

  def show
    render json: readme
  end

  api :POST, '/readmes', 'Create readme'
  description <<-EOS
    == Create readme article
    Is used for creating book
      curl -v localhost:3000/api/v1/readmes -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"text": "some text test"}'
  EOS

  def create
    render json: Readme.create(readme_params)
  end

  def update
    render json: readme.update(readme_params)
  end

  api :DELETE, '/readmes/:id', 'Delete readme'
  description <<-EOS
	  == Delete single readme
	  Is used for delete single readme
	    curl -v localhost:3000/api/v1/readmes/1 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
  EOS

  def destroy
    render json: readme.destroy
  end

  private

  def readme
    Readme.find(params[:id])
  end

  def readme_params
    params.require(:readme).permit(:text)
  end
end