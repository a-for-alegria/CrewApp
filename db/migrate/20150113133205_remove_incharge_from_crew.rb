class RemoveInchargeFromCrew < ActiveRecord::Migration
  def change
  	remove_column :crews, :in_charge
  end
end
