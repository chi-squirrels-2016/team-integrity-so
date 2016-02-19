get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  ensure_login
  @question = Question.find(params[:id])
  @question_responses = Response.where(responsable_type: 'Question', responsable_id: @question.id)
  @answers = Answer.where(question_id: @question.id)
  count = @question.view_count
  count += 1
  @question.view_count = count
  @question.save
  @answer_responses = []
  @answers.each do |answer|
    @answer_responses << Response.where(responsable_type: 'Answer', responsable_id: answer.id)
  end
  @answers.each do |answer|
    if answer.id == @question.best_answer_id
      @star = answer.id
    end
  end
  erb :'questions/show'
end

get '/questions/:question_id/answers/:answer_id/best_answer' do
  question = Question.find(params[:question_id])
  if question.user_id == current_user.id
    question.best_answer_id = params[:answer_id]
    question.save
    redirect "/questions/#{params[:question_id]}"
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

# how to vote
get '/questions/:id/vote' do
  ensure_login

  Vote.create(votable_type: 'Question', votable_id: params[:id], user_id: current_user.id);

  redirect '/questions'
end

# how to enter a question/comment/answer
post '/questions' do
   Question.create(body: params[:body], user_id: current_user.id)
   redirect '/questions'
end



