get '/questions/:id/answers' do
  @question_id = params[:id]
  if request.xhr?
    erb :'answers/new', :layout => false
  else
    erb :'answers/new'
  end
end

post '/questions/:id/answers' do
  @answer = Answer.new(body: params[:body], user_id: current_user.id, question_id: params[:id])
  if request.xhr?
    if @answer.save
      status 200
      question = Question.find(params[:id])
      erb :"answers/_new", :layout => false, locals: {question: question}
    end
  else
    if @answer.save
      redirect "/questions/#{params[:id]}"
    else
      @question_id = params[:id]
      @errors = @answer.errors.full_messages
      erb :'answers/new'
    end
  end
end
