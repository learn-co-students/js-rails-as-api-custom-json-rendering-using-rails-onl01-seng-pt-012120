class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  # another way to exclude data
  # def index
  #   birds = Bird.all
  #   render json: birds.to_json(except: [:created_at, :updated_at])
  # end

  # the slice function works only with a single hash
  def show
    bird = Bird.find_by(id: params[:id])
    # this is needed to handel errors
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: (message: 'Bird not found')
    end 
  end

  # another way of defining which info to pass
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end

end