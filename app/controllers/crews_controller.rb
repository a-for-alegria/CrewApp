class CrewsController < ApplicationController
	before_filter :crew_finder, only: [:show, :edit, :update]
  before_filter :parce_clients, only: [:index, :new, :edit, :update, :create]
  before_filter :redirect

  def index
		@crews = Crew.all
	end

	def new
		@crew = Crew.new
	end

	def create
    @crew = Crew.new(crew_params)
    if @crew.save
      redirect_to root_path
      flash[:success] = "Successfully created"
    else
      render 'new'
    end
  end

  def show
  end

  def edit

  end

  def update
    if @crew.save
      @crew.update_attributes(crew_params)
      redirect_to @crew
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
    def parce_clients
      @clients = Client.all
    end

    def redirect
      redirect_to start_pages_start_path unless signed_in?
    end

    def crew_finder
      @crew = Crew.find(params[:id])
    end

    def crew_params
      params.require(:crew).permit(:name, :secondname, :avatar, :in_charge, :bank_card, :bank_name, :client_project, :rate)
    end
end
