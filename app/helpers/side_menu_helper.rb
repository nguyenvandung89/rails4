module SideMenuHelper
  def side_menues
    [
      {
        group: :home,
        heading: ->{categories_path}
      },
      {
        group: :manage_cars,
        heading: ->{"#"},
        collapses: {
          post_buy_cars: -> {admin_post_buy_cars_path},
          salon_cars: ->{admin_salon_cars_path},
          exteriors: -> {admin_exteriors_path},
          interiors: ->{admin_interiors_path},
          gearboxes: ->{admin_gearboxes_path},
          drivens: ->{admin_drivens_path},
          currencies: ->{admin_currencies_path},
          instruction_boots: ->{admin_instruction_boots_path},
          cars: ->{admin_cars_path}
        }
      },
      # {
        # group: :manage_users,
        # heading: ->{"#"},
        # collapses: {
          # users: -> {admin_visitors_path},
        # }
      # },
      {
        group: :manage_master_datas,
        heading: ->{"#"},
        collapses: {
          m_manufacturers: ->{admin_m_manufacturers_path},
          m_amounts: ->{admin_m_amounts_path},
          m_statuses: ->{admin_m_statuses_path},
          m_prefectures: ->{admin_m_prefectures_path},
          m_life_cars: ->{admin_m_life_cars_path},
          m_origins: ->{admin_m_origins_path}
        }
      }
    ]
  end

  def side_menu_include? path_hash
    path_hash.values.map do |url_proc|
      Rails.application.routes.recognize_path(url_proc.call)[:controller]
    end.include? params[:controller]
  end
end
