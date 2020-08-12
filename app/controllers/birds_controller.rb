class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

   
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: birds.species}
    #render json: birds, only: [:id, :name, :species]
    #render json: {id: bird.id, name: bird.name, species: bird,species}
    # or  render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end
end