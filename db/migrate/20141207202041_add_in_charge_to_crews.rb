class AddInChargeToCrews < ActiveRecord::Migration
  def change
  	add_column :crews, :in_charge, :boolean, default: false
  end
end
