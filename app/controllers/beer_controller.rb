class BeerController < ApplicationController

#   def list
#      @beers = Beer.all
#   end

   def index
      @beers = Beer.all
   end

#   def show
#      @beer = Beer.find(params[:id])
#   end

#   def new
#      @book = Book.new
#   end
   
#   def create
#      @beer = Beer.new(params[:beer])
#      if @beer.save
#            redirect_to :action => 'list'
#      else
#            render :action => 'new'
#      end
#   end
end
