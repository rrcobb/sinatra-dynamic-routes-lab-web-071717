require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    "#{params[:number].to_i**2}"
  end

  get '/say/:number/:phrase' do
    params[:number].to_i.times.map { params[:phrase] }.join("\n")
  end

  get '/say/:one/:two/:three/:four/:five' do
    "#{params.values.join(' ')}."
  end

  @@operations = {
    "add" => :+,
    "subtract" => :-,
    "multiply" => :*,
    "divide" => :/,
  }
  get '/:operation/:one/:two' do
    left = params[:one].to_i
    right = params[:two].to_i
    op = @@operations[params[:operation]]
    "#{left.send(op, right)}"
  end

end
