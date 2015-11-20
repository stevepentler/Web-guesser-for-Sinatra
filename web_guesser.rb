require 'sinatra'
require 'sinatra/reloader'
require 'pry'

number = rand(100)

get '/' do 
  guess = params['guess'].to_i
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end 


def check_guess(guess = 0, number)
  if guess == number
    "The SECRET NUMBER is #{number}!"
  elsif guess > number
    (guess - number) > 5 ? "Way too high!" : "Too high!"
  elsif guess < number
    (number - guess)> 5 ? "Way too low!" : "Too low!"
  end 
end 