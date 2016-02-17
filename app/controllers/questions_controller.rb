get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = Answer.where(question_id: @question.id)
  erb :'questions/show'
end
