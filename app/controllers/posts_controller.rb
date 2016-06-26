class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def detail
    @post = Post.find_by id: params[:id]
  end


  def new
     @post = Post.new
  end

  def create
    @post = Post.new
    @post.name = params[:post][:name]
    @post.body = params[:post][:body]
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     redirect_to @post
    else
      render 'edit'
     end
  end


    def delete
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, notice: 'Post Deleted'
    end

    private
      def post_params
        params.require(:post).permit(:name, :body)
      end


end
