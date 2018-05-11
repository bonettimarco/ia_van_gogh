class PaginasEstaticasController < ApplicationController
  def home
    require 'open-uri'
    url = URI.parse('http://vangoghletters.org/vg/letters/RM01/translation.html')
    open(url) do |http|
        response = http.read
        @dados = "response: #{response.inspect}"
    end
  end
end
