class TweetsController < ApplicationController
    get '/tweets' do 
        
        if Helpers.is_logged_in?(session)
             erb :'tweets/index'
        end 
        redirect '/login'
    end 

    get '/tweet/new' do 
        erb :'tweets/new'
    end 

end
