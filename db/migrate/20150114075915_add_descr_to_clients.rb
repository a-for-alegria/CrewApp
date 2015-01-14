class AddDescrToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :descr, :text
  end
end
