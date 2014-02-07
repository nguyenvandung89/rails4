class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :m_manufacturer
      t.references :m_life_car
      t.references :gearbox
      t.references :exterior
      t.references :interior
      t.references :instruction_boot
      t.references :currency
      t.references :m_status
      t.references :m_origin
      t.references :driven
      t.string :rank
      t.string :start_year
      t.string :km_use
      t.integer :amount
      t.string :number_door
      t.string :number_seat
      t.string :fuel
      t.string :system_fuel
      t.integer :consumption_fuel
      t.string :description
      t.boolean :airbags_for_driver
      t.boolean :airbags_for_fron_passengers
      t.boolean :airbags_for_rear_passengers
      t.boolean :two_row_side_airbags
      t.boolean :airbag_suspension_two_seats_and_after
      t.boolean :antilock_brakes
      t.boolean :electronic_brake_distribution
      t.boolean :emergency_brake_assist
      t.boolean :automatic_electronic_balance
      t.boolean :cruise_control
      t.boolean :back_support_alerts
      t.boolean :traction_control_system
      t.boolean :safety_latches
      t.boolean :automatic_door_lock
      t.boolean :power_door_lock_remote_control
      t.boolean :engine_immobilizer
      t.boolean :burglar_alarm_system_peripheral
      t.boolean :fog_lights
      t.boolean :warning_lights_seatbelt
      t.boolean :brake_3rd_light_mounted_high_side
      t.boolean :positioning_equipment
      t.boolean :roof_window
      t.boolean :glass_electric_adjustment
      t.boolean :power_steering
      t.string :seat_material
      t.boolean :air_conditioner_ago
      t.boolean :after_conditioning
      t.boolean :supports_auto
      t.boolean :tumble_glass_after
      t.boolean :fan_behind_glass
      t.boolean :stained_glass
      t.boolean :lcd_screen
      t.string :device_audio_video
      t.string :device_other
      t.string :width_wide_height
      t.string :wheelbase
      t.string :tread_front_rear
      t.string :weight
      t.string :fuel_tank_capacity
      t.string :engine
      t.string :engine_type
      t.string :cylinder_capacity
      t.string :brake
      t.string :reducing_care
      t.string :tires
      t.string :rim_wheels
      t.string :other_specifications

      t.timestamps
    end
  end
end
