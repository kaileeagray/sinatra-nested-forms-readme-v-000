require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :new
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:course].each do |course, details|
      Course.new(details)
    end

    @classes = Course.all

    erb :student
  end

end
