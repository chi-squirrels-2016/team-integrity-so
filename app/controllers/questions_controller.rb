get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
