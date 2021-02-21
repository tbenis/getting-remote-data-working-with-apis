require 'net/http' #NET::HTTP is a Ruby library that allows your program or application to send HTTP requests
require 'open-uri' # URI library  helps Ruby to handle URIs (This, json, and net/http are libraries)
require 'json'
require 'awesome_print'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs #get_programs method that uses the NET::HTTP library to send an HTTP request from our program
    uri = URI.parse(URL) 
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

programs = GetPrograms.new
puts programs.program_school.uniq

# programs = GetPrograms.new.get_programs
# puts programs
