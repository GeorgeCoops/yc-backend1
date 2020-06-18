class PostsController < ApplicationController
    before_action :authorised?, only: [:update]

    def index
        posts = Post.all
        render json: posts.to_json(:include => {
            :post_images => {:only => [:url]}
        })
    end

    def show 
        post = Post.find_by_id(params[:id])  
        render json: post.to_json
    end

    def new 
        post = Post.new
    end

    def create 
        post = Post.create(position: params[:position], company: params[:company], location: params[:location], length: params[:length], jobLink: params[:jobLink], instagram: params[:instagram], facebook: params[:facebook], description: params[:description], accepted: false)
        render json: post, status: 200 if post.save!
    end

    def update
        post = Post.find(params[:id])
        post.update(
            # position: params[:position], 
            # company: params[:company], 
            # location: params[:location], 
            # length: params[:length], 
            # jobLink: params[:jobLink], 
            # instagram: params[:instagram], 
            # facebook: params[:facebook], 
            # description: params[:description], 
            accepted: params[:accepted]
        )    
        render json: post.to_json
    end

    def destroy
        post = Post.find_by_id(params[:id])
        post.destroy
        render json: {}
    end

end
