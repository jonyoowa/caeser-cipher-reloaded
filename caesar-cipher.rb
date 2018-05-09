require "sinatra"

def caesar_cipher(phrase, anyshift)
  shift = anyshift % 26
  output = phrase.split("")
  output.map! do |letter| 
  	if letter.ord.between?('A'.ord, 'Z'.ord)
  	  letter = letter.ord + shift <= 'Z'.ord ? (letter.ord + shift).chr : (letter.ord + shift - 26).chr
  	elsif letter.ord.between?('a'.ord, 'z'.ord)
  	  letter = letter.ord + shift <= 'z'.ord ? (letter.ord + shift).chr : (letter.ord + shift - 26).chr
   	else
  	  letter
  	end
  end
  output.join("")
end

get '/' do
  message = caesar_cipher(params['string'], params['shift'].to_i) unless params['string'].nil?
  erb :index, :locals => {:message => message}
end