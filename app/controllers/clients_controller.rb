class ClientsController < ApplicationController
	before_filter :client_finder, only: [:show, :edit, :update]

  def index
	end

	def new
		@client = Client.new
	end

	def create
    @client = Client.new(client_params)
    if @client.save
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
    if @client.save
      @client.update_attributes(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    client_finder.destroy
    redirect_to root_path
  end

  private

    def client_finder
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:client_name, :client_secondname)
    end
end

