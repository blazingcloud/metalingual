require 'rho/rhocontroller'
require 'helpers/browser_helper'

class WordController < Rho::RhoController
  include BrowserHelper

  def new
    render :action => :new
  end

  def create
    @word = Word.new(@params['word'])
    @word.define
    render :action => :show
  end

  def show
    @word = Word.find(@params['id'])
    if @word
      render :action => :show
    else
      redirect :action => :index
    end
  end

end


#   # POST /Word/{1}/update
#   def update
#     @word = Word.find(@params['id'])
#     @word.update_attributes(@params['word']) if @word
#     redirect :action => :index
#   end

#   # POST /Word/{1}/delete
#   def delete
#     @word = Word.find(@params['id'])
#     @word.destroy if @word
#     redirect :action => :index
#   end

