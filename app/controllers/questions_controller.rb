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
