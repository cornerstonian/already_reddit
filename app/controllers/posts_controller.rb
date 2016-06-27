
class PostsController < ApplicationController

  def index
    @post = Post.all.order("vote_count desc")
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.url = params[:post][:url]
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

    def vote_up
      @posts = Post.all
      @post = Post.find_by id: params[:id]
      @post.vote_count = @post.vote_count.to_i + 1
      @post.save
       redirect_to root_path
     end

     def vote_down
       @posts = Post.all
       @post = Post.find_by id: params[:id]
       @post.vote_count = @post.vote_count.to_i - 1
       @post.save
       redirect_to root_path
     end


    private
      def post_params
        params.require(:post).permit(:title, :body)
      end


end
