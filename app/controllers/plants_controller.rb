class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    # GET /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: { error: "Plant Not Found!"}, status: :not_found
        end
    end

    # POST /plants
    def create
        plant = Plant.create(name: params[:name], image: params[:image], price: params[:price])
        render json: plant, status: :created
    end
end
