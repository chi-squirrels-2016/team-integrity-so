helpers do
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def ensure_login
    if logged_in?
      return true
    else
      halt(404, erb(:'sessions/trapdoor'))
    end
  end
end
