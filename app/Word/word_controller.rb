require 'rho/rhocontroller'
require 'helpers/browser_helper'

class WordController < Rho::RhoController
  include BrowserHelper

  #GET /Word
  def index
    @words = Word.find(:all)
    render
  end

  # GET /Word/{1}
  def show
    @word = Word.find(@params['id'])
    if @word
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Word/new
  def new
    @word = Word.new
    render :action => :new
  end

  # GET /Word/{1}/edit
  def edit
    @word = Word.find(@params['id'])
    if @word
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Word/create
  def create
    @word = Word.new(@params['word'])
    @word.define
    render :action => :show
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

