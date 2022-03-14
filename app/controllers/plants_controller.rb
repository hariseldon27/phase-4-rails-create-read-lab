class PlantsController < ApplicationController

    #GET /plants
    def index
        plants = Plant.all
        render json: plants
    end

    #POST new plant
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
    
    #GET each plant
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "Sorry plant no findy"}, status: :not_found
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
