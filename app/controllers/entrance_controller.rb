class EntranceController < ApplicationController
    before_action :entry_authenticate_user,{only:[:logout_tweetrip]}
    
    def entry_top
  
    end
  
    def login_tweetrip
      @entry_user = Entrance.find_by(password: params[:entry_password],entry_user_id: params[:entry_user_id])
      if @entry_user
        session[:entry_user_id] = @entry_user.id
        flash[:notice] = "利用者権限の取得に成功しました"
        redirect_to("/")
      else
        flash[:notice] = "パスワードまたはユーザーIDが違います"
        redirect_to("/entrance/entry_top")
      end
    end
  
    def logout_tweetrip
      session[:entry_user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/entrance/entry_top")
    end
end
