class ProjectsController < ApplicationController
	before_filter :project_finder, only: [:show, :edit, :update]
  before_filter :parce_projects, only: [:new, :edit]
  before_filter :redirect

  def index
	end

	def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
        format.json { render action: 'index', status: :created, location: @project }
        format.js   { render action: 'index', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js   { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit

  end

  def update
    if @project.save
      @project.update_attributes(project_params)
      redirect_to @project
      flash[:success] = "Changes saved successfully"
    else
      redirect_to @project
    end
  end

  def destroy
    project_finder.destroy
    redirect_to root_path
    flash[:alert] = "Successfully deleted"
  end

  private
    def parce_projects
      @projects = Project.where(user_id: current_user.id).load
    end

    def redirect
      redirect_to start_pages_start_path unless user_signed_in? 
    end

    def project_finder
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:client_name, :client_secondname, :project_name, :budget, :descr)
    end
end

