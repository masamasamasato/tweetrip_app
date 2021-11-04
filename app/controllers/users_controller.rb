class UsersController < ApplicationController
  before_action :entry_authenticate_user
  def index
    if params[:search] == nil
        @users = User.all.order(created_at: :desc)
    elsif params[:search] == ''
        @users = User.all.order(created_at: :desc)
    else
        #部分検索
        @users = User.where("name LIKE ? ",'%' + params[:search] + '%')
        @users = @users.all.order(created_at: :desc)
    end
    @users = @users.page(params[:page]).per(10)
end

  def show
    @user=User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @entry = Entry.new
      end
  end

  def following
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(3).reverse_order
  end

end
