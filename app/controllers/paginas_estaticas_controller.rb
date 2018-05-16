class PaginasEstaticasController < ApplicationController
  def home
        require 'open-uri'
        @dados = [[],[]]
#        arquivos = ['/artwork.html','/facsimile.html','/letter.html','/line_endings.html','/notes.html','/original_text.html','/print.html','/translation.html']
        variavel = '/translation.html'
    (1..25).each do |n|
#    (3..5).each do |n|
        if n < 10
            @url = URI.parse("http://vangoghletters.org/vg/letters/RM0#{n.to_s}#{variavel}")
          elsif n < 100
           @url = URI.parse("http://vangoghletters.org/vg/letters/RM#{n.to_s}#{variavel}")
        end
        open(@url) do |http|
            @texto = http.read
        end
        	 resposta =+ "-------------------------"+n.to_s+" = "+@texto.gsub(/<\/?[^>]*>/, "")
        	 resposta.slice!('&nbsp;1r:1')
        	 resposta.slice!('top')
#        	 resposta = resposta.gsub("\n", "<br>")
        	 @dados[0][n] = resposta
      end
        CSV.open("./rms.csv", "wb") do |csv|
            while(row = @dados.pop)
                csv << row
            end
        end
        @dados = [[],[]]
#    (1..902).each do |n|
    (702..902).each do |n|
        if n < 10
            @url = URI.parse("http://vangoghletters.org/vg/letters/let00#{n.to_s}#{variavel}")
          elsif n < 100
           @url = URI.parse("http://vangoghletters.org/vg/letters/let0#{n.to_s}#{variavel}")
          else
            @url = URI.parse("http://vangoghletters.org/vg/letters/let#{n.to_s}#{variavel}")
        end
        open(@url) do |http|
            @texto = http.read
        end
        	 resposta =+ "-------------------------"+n.to_s+" = "+@texto.gsub(/<\/?[^>]*>/, "")
        	 resposta.slice!('&nbsp;1r:1')
        	 resposta.slice!('top')
        	 @dados[0][n] = resposta
      end
        CSV.open("./leters.csv", "wb") do |csv|
            while(row = @dados.pop)
                csv << row
            end
        end
      
  end
end

