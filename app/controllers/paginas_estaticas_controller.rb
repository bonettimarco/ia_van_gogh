class PaginasEstaticasController < ApplicationController
  def home
        require 'open-uri'
        @dados = Array.new
    (1..25).each do |n|
        if n < 10
            @url = URI.parse("http://vangoghletters.org/vg/letters/RM0#{n.to_s}/translation.html")
          elsif n < 100
           @url = URI.parse("http://vangoghletters.org/vg/letters/RM#{n.to_s}/translation.html")
        end
        open(@url) do |http|
            @texto = http.read
        end
        	 resposta =+ ""+n.to_s+" = "+@texto.gsub(/<\/?[^>]*>/, "")
        	 resposta.slice!('&nbsp;1r:1')
        	 resposta.slice!('top')
        	 @dados << resposta
      end
      
    (1..2).each do |n|
        if n < 10
            @url = URI.parse("http://vangoghletters.org/vg/letters/let00#{n.to_s}/translation.html")
          elsif n < 100
           @url = URI.parse("http://vangoghletters.org/vg/letters/let0#{n.to_s}/translation.html")
          else
            @url = URI.parse("http://vangoghletters.org/vg/letters/let#{n.to_s}/translation.html")
        end
        open(@url) do |http|
            @texto = http.read
        end
        	 resposta =+ ""+n.to_s+" = "+@texto.gsub(/<\/?[^>]*>/, "")
        	 resposta.slice!('&nbsp;1r:1')
        	 resposta.slice!('top')
        	 @dados << resposta
      end
  end
end

