class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to cars_path
    else
      @title = "Home"
    end
  end
  
  def about
    @title = "About"
  end
  
  def contact
    @title = "Contact"
  end
end
