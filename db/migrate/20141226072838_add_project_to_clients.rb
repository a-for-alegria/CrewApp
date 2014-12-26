class AddProjectToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :project, :string
  end
end
