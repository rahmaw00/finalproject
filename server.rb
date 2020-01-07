require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'


set :port, 3000
set :database, {adapter: 'postgresql',
                database: 'birdpress',
                username: 'postgres',
                password: ENV['POSTGRES_PW']
               }
# specified username and password (how secure is that), but don't want anyone to see it, so delete it. will it still work without specification?

enable :sessions


get '/' do
    erb :home
end

get '/login' do
    erb :login
end

post '/login' do
    user = User.find_by(email: params[:email])
    passcode = params[:password]
    if user.password == passcode
        session[:user_id] = user_id
        redirect '/profile'
    else
        flash[:error] = 'Invalid email or password. Please try again'
        redirect '/login'
    end
end

get '/logout' do
    erb :logout
end

post '/logout' do
    redirect '/'
end

get '/signup' do
    erb :signup
end

post '/signup' do
    @user = User.new(params[:user])
    if @user.valid?
        @user.save
        redirect '/profile'
        p 'Welcome to Birdpress!'
    else
        flash[:error] = @user.errors.full_messages
        redirect '/signup'
    end
end

get '/profile' do
    erb :profile
end
