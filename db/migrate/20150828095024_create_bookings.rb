class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
        t.integer :user_id
        t.integer :property_id
        t.date :booked_from
        t.date :booked_until
        t.timestamps null:false
    end
  end
end
