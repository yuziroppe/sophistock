class SessionController < ApplicationController
    def top
    end

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            return redirect_to '/users/me'
        end
        render :top
    end

    def log_out
        session.delete(:id)
        @current_user = nil
        redirect_to '/'
    end

    def signUp
    end

    def register
        user = User.new(user_params)
        if user.save
            session[:id] = user.id
            return redirect_to '/users/me'
        end
        return render :signUp
    end

    private
    def user_params
        params.permit(:name,:email,:password,:password_confirmation)
    end
end
  