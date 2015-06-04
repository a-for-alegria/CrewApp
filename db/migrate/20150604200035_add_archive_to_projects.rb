class AddArchiveToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :archive, :boolean, default: false
  end
end
