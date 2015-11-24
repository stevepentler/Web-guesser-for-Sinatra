require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = (rand(100) + 1)

get '/' do 
  guess = params['guess']
  cheat = params['cheat']
  message = check_guess(guess, cheat)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end 

def check_guess(guess, cheat)
  number = SECRET_NUMBER
  guess = guess.to_i
  if guess.zero?
    "Please enter a guess!"
  elsif cheat == "true"
    "Psst! Ms. Cleo recommends #{number}!"
  elsif guess == number 
    "THE SECRET NUMBER IS #{number}"
  elsif guess > number
    (guess - number) > 5 ? "Way too high!" : "Too high!"
  elsif guess < number
    (number - guess)> 5 ? "Way too low!" : "Too low!"
  end 
end 

def check_background_color(message)
  if message.split.include?("enter")
    "white"
  elsif message.split.include?("Way")
    "red"
  elsif message.split.include?("Too")
    "pink"
  elsif message.split.include?("SECRET")
    "green"
  end
end