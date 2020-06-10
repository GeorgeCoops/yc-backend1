class PostImagesController < ApplicationController

    def index
        postImages = PostImage.all
        render json: postImages.to_json
    end

    def show 
        post_image = PostImage.find_by_id(params[:id])  
        render json: post_image.to_json
    end

    def new 
        post_image = PostImage.new
    end

    def create 
        post_image = PostImage.create(url: params[:url], post_id: params[:post_id])
        render json: post_image, status: 200 if post_image.save!
    end

    def update
        post_image = PostImage.find(params[:id])
        post_image.update(url: params[:url], post_id: params[:post_id])   
        render json: post_image.to_json
    end

    def destroy
        post_image = PostImage.find_by_id(params[:id])
        post_image.destroy
        render json: {}
    end

end
