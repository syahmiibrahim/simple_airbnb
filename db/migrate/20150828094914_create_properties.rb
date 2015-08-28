class CreateProperties < ActiveRecord::Migration
  def change
  	create_table :properties do |t|
  		t.integer :user_id
  		t.string  :title
  		t.string  :address
      t.string  :description
  		t.decimal :price, :precision => 10, :scale => 2
  		t.timestamps null:false
  	end
  end
end
