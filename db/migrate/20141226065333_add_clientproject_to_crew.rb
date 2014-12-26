class AddClientprojectToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :client_project, :string
  end
end
