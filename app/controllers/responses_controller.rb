
get '/questions/:id/responses' do
  @question_id = params[:id]
  erb :'responses/new_question_response'
end

get '/answers/:id/responses' do
  @answer_id = params[:id]
  erb :'responses/new_answer_response'
end

post '/questions/:id/responses' do
  @question_response = Response.new(body: params[:body], responsable_type: 'Question', responsable_id: params[:id], user_id: current_user.id)
  if @question_response.save
    redirect "/questions/#{params[:id]}"
  else
    @errors = @question_response.errors.full_messages
    erb :'responses/new_question_response'
  end
end

post '/answers/:id/responses' do
  @answer_response = Response.new(body: params[:body], responsable_type: 'Answer', responsable_id: params[:id], user_id: session[:user_id])
  if @answer_response.save
    redirect '/questions'
  else
    @errors = @answer_response.errors.full_messages
    erb :'responses/new_question_response'
  end
end
