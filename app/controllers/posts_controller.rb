class PostsController < ApplicationController
    before_action :entry_authenticate_user
    before_action :authenticate_user!
    
    def index
        if params[:search] == nil
            @posts = Post.all.order(created_at: :desc)
        elsif params[:search] == ''
            @posts = Post.all.order(created_at: :desc)
        else
            #部分検索
            @posts = Post.where("content LIKE ? ",'%' + params[:search] + '%')
            @posts = @posts.all.order(created_at: :desc)
        end
        @posts = @posts.page(params[:page]).per(10)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        @post.user_id = current_user.id
        
        if @post.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to :action => "show", :id => @post.id
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to action: :index
    end


    private
    def post_params
        params.require(:post).permit(:content,:image,:video)
    end

end
