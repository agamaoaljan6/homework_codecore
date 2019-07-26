class UsersController < ApplicationController
        before_action :authenticate_user!, only: [:edit, :show, :update, :password, :password_update]
        before_action :find_user_params, only: [:edit, :show, :update, :password, :password_update]
        before_action :authorize, only: [:edit, :update, :password, :password_update]
    
    def new 
        @user = User.new 
    end

    def create
        @user = User.create user_params
        if @user.save
            session[:user_id] = @user.id # What does this one do? 
            redirect_to root_path
        else 
            render :new
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
                redirect_to password_update_path
            else
                flash[:danger] = @user.errors.full_messages.join(', ')
                redirect_to password_path(@user)
            end
        else
            flash[:danger] = "You've entered an invalid current password"
            redirect_to password_update_path  
        end
    end

    def update
        if @user.update user_params
            flash[:success] = "Profile updated"
            redirect_to edit_user_path
        else
            flash[:danger] = @user.errors.full_messages.join(', ')
            redirect_to edit_user_path(current_user)
        end
    end

    def show
    end

    private 

    def find_user_params
        @user = User.find params[:id]
    end

    def user_params
        params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email,
            :password, 
            :password_confirmation)
    end

    def authorize
        unless can? :crud, @user
            flash[:danger] = "Not Authorized"
            redirect_to root_path
        end
    end
end

