class FoodsController < ApplicationController

    def index
        @foods = Food.all
    end

    def new
        @food = Food.new
    end

    def create
        food = Food.create(permit_params)
        redirect_to food
    end

    def show
        @food = Food.find(params[:id])
    end

    def edit
        @food = Food.find(params[:id])
    end
    
    def update
        food = Food.find(params[:id])
        food.update(permit_params)
        redirect_to food
    end
    
    def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to foods_path
    end

    def permit_params
        params.require(:food).permit(:restaurant_id, :name, :description, :img_url, :price)
    end 
end