class CrewsController < ApplicationController
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
    @crew = Crew.find(params[:id])
  end

  private

    def crew_params
      params.require(:crew).permit(:name, :secondname)
    end
end
