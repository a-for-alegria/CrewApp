class ChangeDobInCrew < ActiveRecord::Migration
  def change
  	change_column :crews, :dob, 'date USING CAST(dob AS date)'
  end
end
