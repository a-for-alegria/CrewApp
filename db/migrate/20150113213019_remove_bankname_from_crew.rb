class RemoveBanknameFromCrew < ActiveRecord::Migration
  def change
  	remove_column :crews, :bank_name
  end
end
