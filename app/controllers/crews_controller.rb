class CrewsController < ApplicationController
	before_filter :crew_finder, only: [:show, :edit, :update]
  before_filter :parce_projects, only: [:index, :new, :edit, :update, :create]
  before_filter :parce_crew, only: [:index]
  before_filter :redirect

  def index
    @project_budget = parce_projects.pluck(:budget).sum
    @crew_rate = parce_crew.pluck(:rate).sum
    @crew = Crew.new
	end

	def create
    @crew = current_user.crews.build(crew_params)
    respond_to do |format|
      if @crew.save
        format.html { redirect_to root_path, notice: 'Crew was successfully created.' }
        format.json { render action: 'index', status: :created, location: @crew }
        format.js   { render action: 'index', status: :created, location: @crew }
      else
        format.html { render action: 'new' }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
        format.js   { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
    # if @crew.save
    #   redirect_to root_path
    #   flash[:success] = "Successfully created"
    # else
    #   render 'new'
    # end
  end

  def show
  end

  def edit

  end

  def update
    if @crew.save
      @crew.update_attributes(crew_params)
      redirect_to @crew
      flash[:success] = "Changes saved successfully"
    else
      render 'edit'
    end
  end

  def destroy
    crew_finder.destroy
    redirect_to root_path
    flash[:alert] = "Successfully deleted"
  end

  private
    def parce_projects
      @projects = current_user.projects
    end

    def parce_crew
      @crews = current_user.crews
    end

    def redirect
      redirect_to start_pages_start_path unless user_signed_in?
    end

    def crew_finder
      @crew = Crew.find(params[:id])
    end

    def crew_params
      params.require(:crew).permit(:name, :secondname, :avatar, :in_charge, :bank_card, :bank_name, :client_project, :rate, :spec)
    end
end
