class ProjectsController < ApplicationController
  before_action :only => [:new, :edit] do
    redirect_to edit_user_registration_path unless current_user && current_user.admin
  end
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project added'
      redirect_to projects_path
    else
      flash[:alert] = 'Project not added'
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = 'Project updated'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Project not updated'
      render :edit
    end
  end

  def destroy
    binding.pry
    @project = Project.find(params[:id])
    p @project, 'yo'
    @project.destroy
    flash[:notice] = 'Project removed'
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

end
