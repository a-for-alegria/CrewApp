class AddRateToCrews < ActiveRecord::Migration
  def change
  	add_column :crews, :rate, :integer
  end
end
