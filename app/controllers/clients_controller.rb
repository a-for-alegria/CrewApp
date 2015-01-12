class ClientsController < ApplicationController
	before_filter :client_finder, only: [:show, :edit, :update]
  before_filter :parce_clients, only: [:index, :new, :edit]
  before_filter :redirect

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
    def parce_clients
      @clients = Client.all
    end

    def redirect
      redirect_to start_pages_start_path unless signed_in?
    end

    def client_finder
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:client_name, :client_secondname, :project)
    end
end

