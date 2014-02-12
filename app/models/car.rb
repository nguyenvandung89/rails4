class Car < ActiveRecord::Base
  require "carrierwave/orm/activerecord"

  PERMITTED_PARAMS = [:name, :sale_price, :title, :m_manufacturer_id, :m_life_car_id, :gearbox_id, :exterior_id, :interior_id, :instruction_boot_id,
    :currency_id, :m_status_id, :m_origin_id, :driven_id, :rank, :start_year, :km_use,
    :number_door, :number_seat, :fuel, :system_fuel, :consumption_fuel, :description,
    :airbags_for_driver, :airbags_for_fron_passengers, :airbags_for_rear_passengers,
    :two_row_side_airbags, :airbag_suspension_two_seats_and_after, :antilock_brakes,
    :electronic_brake_distribution, :emergency_brake_assist, :automatic_electronic_balance,
    :cruise_control, :back_support_alerts, :traction_control_system, :safety_latches,
    :automatic_door_lock, :power_door_lock_remote_control, :engine_immobilizer,
    :burglar_alarm_system_peripheral, :fog_lights, :warning_lights_seatbelt,
    :brake_3rd_light_mounted_high_side, :positioning_equipment, :roof_window,
    :glass_electric_adjustment, :power_steering, :seat_material, :air_conditioner_ago,
    :after_conditioning, :supports_auto, :tumble_glass_after, :fan_behind_glass,
    :stained_glass, :lcd_screen, :device_audio_video, :device_other, :width_wide_height,
    :wheelbase, :tread_front_rear, :weight, :fuel_tank_capacity, :engine, :engine_type,
    :cylinder_capacity, :brake, :reducing_care, :tires, :rim_wheels, :other_specifications, :visibility,
    :image1, :image1_cache, :amount,
    :remove_image1, :image2, :image2_cache, :remove_image2, :image3, :image3_cache,
    :remove_image3, :image4, :image4_cache, :remove_image4, :image5, :image5_cache,
    :remove_image5, :image6, :image6_cache, :remove_image6]
    
  belongs_to :m_manufacturer, class_name: M::Manufacturer.name
  belongs_to :m_life_car, class_name: M::LifeCar.name
  belongs_to :gearbox
  belongs_to :exterior
  belongs_to :interior
  belongs_to :instruction_boot
  belongs_to :currency
  belongs_to :m_status, class_name: M::Status.name
  belongs_to :m_origin, class_name: M::Origin.name
  belongs_to :driven

  mount_uploader :image1, PictureUploader
  mount_uploader :image2, PictureUploader
  mount_uploader :image3, PictureUploader
  mount_uploader :image4, PictureUploader
  mount_uploader :image5, PictureUploader
  mount_uploader :image6, PictureUploader

  scope :sales, -> {where(sale_price: true)}
end