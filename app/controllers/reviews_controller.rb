class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
    end

    def create
        review = Review.create(permit_params)
        redirect_to review
    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end
    
    def update
        review = Review.find(params[:id])
        review = Review.update(permit_params)
        redirect_to review
    end
    
    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to reviews_path
    end

    def permit_params
        params.require(:review).permit(:restaurant_id, :customer_id, :subject, :content, :rating)
    end
end