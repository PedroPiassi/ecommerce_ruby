class SettingsController < ApplicationController
  before_action :authenticate_user!
  
  def index; end

  def update_user
    if current_user.update(user_params)
      redirect_to settings_path, notice: 'Dados atualizados com sucesso.'
    else
      render :index
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone, :avatar)
  end
end
