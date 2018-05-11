class PaginasEstaticasController < ApplicationController
  def home
    open("http://www.ruby-lang.org/") {|f|
      f.each_line {|line| @dados << line}
    }
  end
end
