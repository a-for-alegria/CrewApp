class AddBanknameToCrew < ActiveRecord::Migration
  def change
  	add_column :crews, :bank_name, :string
  end
end
