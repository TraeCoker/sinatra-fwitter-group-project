class UsersController < ApplicationController
    get '/signup' do 
        if Helpers.is_logged_in?(session)
            redirect '/tweets'
        end 
        erb :'users/new'
      end 

    post '/signup' do 
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user_id
            redirect '/tweets'
        else 
            redirect '/signup'
        end 
    end 

    get '/login' do 
        if Helpers.is_logged_in?(session)
            redirect '/tweets'
        end 

        erb :'users/login'
    end 

    post '/login' do 
        

        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            current_user
            redirect to '/tweets'
        end 
        redirect '/login'
    end 

    get '/logout' do 
        if Helpers.is_logged_in?(session)
            session.clear
            redirect '/login'
        else 
            redirect '/'
        end 
    end 

end
