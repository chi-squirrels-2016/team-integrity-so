get '/' do
  erb :index
end

get '/profile' do
  redirect 'users/show'
end

get '/users/:id' do



  erb :'users/show'
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  if User.find_by_email(params[:email]).nil?
    @message = "Sorry, incorrect Email or Password"
    erb :'users/login'
  else
    user = User.find_by_email(params[:email])
    @password = params[:password]
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      @message = "Sorry, incorrect Email or Password"
      erb :'users/login'
    end
  end
end

get '/register' do
  erb :'users/register'
end

post '/register' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end
