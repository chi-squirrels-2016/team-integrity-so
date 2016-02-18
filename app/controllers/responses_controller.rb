
get '/questions/:id/responses' do
  @question_id = params[:id]
  if request.xhr?
    erb :'responses/new_question_response', layout: false
  else
    erb :'responses/new_question_response'
  end
end

get '/answers/:id/responses' do
  @answer_id = params[:id]
  if request.xhr?
    erb :'responses/new_answer_response', :layout => false
  else
    erb :'responses/new_answer_response'
  end
end

post '/questions/:id/responses' do
  @question_response = Response.new(body: params[:body], responsable_type: 'Question', responsable_id: params[:id], user_id: current_user.id)
  if request.xhr?
    if @question_response.save
      status 200
      erb :_comment, layout: false, locals: {question_response: @question_response}
    else
      status 422
    end
  else
    if @question_response.save
      redirect "/questions/#{params[:id]}"
    else
      @question_id = params[:id]
      @errors = @question_response.errors.full_messages
      erb :'responses/new_question_response'
    end
  end
end

post '/answers/:id/responses' do
  @answer_response = Response.new(body: params[:body], responsable_type: 'Answer', responsable_id: params[:id], user_id: session[:user_id])
  answer_object = Answer.find(params[:id])
  question_id = answer_object.question_id
  if request.xhr?
    p "***************************%%%%%"
    if @answer_response.save
      p @answer_response.id
      status 200
      erb :'_answer-comment', :layout => false
    else
      status 422
    end
  else
    if @answer_response.save
      redirect "/questions/#{question_id}"
    else
      @answer_id = params[:id]
      @errors = @answer_response.errors.full_messages
      erb :'responses/new_question_response'
    end
  end
end
