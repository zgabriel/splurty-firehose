class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
        flash[:error] = '<strong>INVALID INPUT!</strong> try again, beavis.'
    end
    redirect_to root_path
  end
  
  def about
  end
  
  private
  
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
  
end
