class RenameProjectInCleints < ActiveRecord::Migration
  def change
  	rename_column :clients, :project, :project_name
  end
end
