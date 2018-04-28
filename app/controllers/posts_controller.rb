class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def new
    @project = Project.find(params[:project_id])
    @post = @project.posts.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.new(post_params)
    if @post.save
      flash[:notice] = 'post added'
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  # def index
  #   @projects = Project.all
  # end

  def show
    # @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    # redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Editted post'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Post not editted please try again'
      # see if view below is right or if should be show
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to project_path(@project)
  end

  private
  def post_params
    params.require(:post).permit(:content, :rating)
  end

end
