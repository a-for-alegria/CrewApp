class ChangeDobInCrew < ActiveRecord::Migration
  def change
  	change_column :crews, :dob, :date
  end
end
