class CrewsController < ApplicationController
	before_filter :crew_finder, only: [:show, :edit, :update]

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

  private

    def crew_finder
      @crew = Crew.find(params[:id])
    end

    def crew_params
      params.require(:crew).permit(:name, :secondname)
    end
end
