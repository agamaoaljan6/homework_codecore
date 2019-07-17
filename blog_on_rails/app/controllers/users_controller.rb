class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :show, :update, :password, :password_update]
    
    def new 
        @user = User.new 
    end


    def create
        @user = User.create params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :password, 
            :password_confirmation)
        if @user.save
            session[:user_id] = @user.id # What does this one do? 
            redirect_to root_path
        else 
            render 'new'
        end
    end 

    def edit

    end

    def password

    end

    def password_update
        if @user&.authenticate params[:user][ :current_password ]
            if @user.update user_params
                flash[:success] = "Password updated"
                redirect_to user_path
            else
                flash[:danger] = @user.errors.full_messages.join(', ')
                redirect_to request.referrer
            end
        else
            flash[:danger] = "You've entered an invalid current password"
            redirect_to request.referrer    
        end
    end

    def update
        if @user.update user_params
            flash[:success] = "Profile updated"
            redirect_to user_path
        else
            flash[:danger] = @user.errors.full_messages.join(', ')
            redirect_to request.referrer
        end
    end

    def show
    end

end