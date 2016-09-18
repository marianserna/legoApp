class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource
    resource.build_dragonfly
    respond_with resource
  end

  protected

  def configure_permitted_parameters
    # On sign up permit these form fields (keys). Additionally, permit attributes from the dragon.
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [
        :name, :age, :email, :image, :password, :password_confirmation,
        dragonfly_attributes: [:name, :breeding_time, :image]
      ]
    )
  end

end
