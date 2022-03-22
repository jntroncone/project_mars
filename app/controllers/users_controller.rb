class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def index
        @user = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

end
