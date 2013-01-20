class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :scheduled_at
      t.date :s_date
      t.time :s_time

      t.timestamps
    end
  end
end
