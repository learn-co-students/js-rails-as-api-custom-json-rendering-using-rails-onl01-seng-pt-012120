class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:name, :id, :species]
    # or
    # render json: birds, except: [:created_at, :updated_at]
    # which is implicit version of....
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # or
    if bird
      render json: bird.slice(:id, :name, :species) 
    else
      render json: {:message => "Bird with an id of #{params[:id]} not found!"}
    end
  end
end