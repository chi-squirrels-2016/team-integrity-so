get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question_responses = Response.where(responsable_type: 'Question', responsable_id: @question.id)
  @answers = Answer.where(question_id: @question.id)
  @answer_responses = []
  @answers.each do |answer|
    @answer_responses << Response.where(responsable_type: 'Answer', responsable_id: answer.id)
  end
  erb :'questions/show'
end


# how to vote
get '/questions/:id/vote' do
  ensure_login

  Vote.create(votable_type: 'Question', votable_id: params[:id], user_id: current_user.id);

  # Enter an error message for multiple votes with ajax/jquery
  # if Vote.where(votable_type: 'Question', votable_id: params[:id], user_id: current_user.id)
  #   @message = "We've already counted your vote on this. Thanks for voting!"
  #   erb "questions/show"
  # else
  #   Vote.create(votable_type: 'Question', votable_id: params[:id], user_id: current_user.id);
  # end

  redirect '/questions'
end

# how to enter a question/comment/answer
post '/questions' do
   Question.create(body: params[:body], user_id: current_user.id)
   redirect '/questions'
end



