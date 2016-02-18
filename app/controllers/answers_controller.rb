get '/questions/:id/answers' do
  @question_id = params[:id]
  erb :'answers/new'
end

post '/questions/:id/answers' do
  @answer = Answer.new(body: params[:body], user_id: current_user.id, question_id: params[:id])
  if @answer.save
    redirect "/questions/#{params[:id]}"
  else
    @question_id = params[:id]
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end
end
