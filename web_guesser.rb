require 'sinatra'
require 'sinatra/reloader'
x = rand(1..100)
get '/' do 
  "Greg has #{x} Penises"
end 

