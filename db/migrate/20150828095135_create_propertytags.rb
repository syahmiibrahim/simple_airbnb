class CreatePropertytags < ActiveRecord::Migration
  def change
    create_table :propertytags do |t|
        t.integer :property_id
        t.integer :tag_id
        t.timestamps null:false
    end
  end
end
