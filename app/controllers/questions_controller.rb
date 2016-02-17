get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question_responses = Response.where(responsable_type: 'Question', responsable_id: @question.id)
  @answers = Answer.where(question_id: @question.id)
  p @answers
  answer1 = @answers[0]
  @answer_responses = Response.where(responsable_type: 'Answer', responsable_id: answer1.id)
  p @answer_responses

  erb :'questions/show'
end
