class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_entry_user
    
    def set_entry_user
        @current_entry_user = Entrance.find_by(id: session[:entry_user_id])
    end

    def entry_authenticate_user
        if @current_entry_user == nil
            redirect_to("/entrance/entry_top")
        end
    end

    protected
    def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
    end
end
