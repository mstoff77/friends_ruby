# This shiny device polishes bared foos
class HomeController < ApplicationController
  def index
    puts "home page"
  end
  def about
    puts "about page"
    @hello_var="Hello World"
    @solution= 3+2
  end
end
