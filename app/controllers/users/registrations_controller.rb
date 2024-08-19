class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  # Дозволяємо додаткові параметри для реєстрації
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address, :role])
  end

  # Після реєстрації перенаправляємо користувача на головну сторінку або інший шлях
  def after_sign_up_path_for(resource)
    root_path # або будь-який інший шлях, куди ви хочете направити користувача після реєстрації
  end
end
