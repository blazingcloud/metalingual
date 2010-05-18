require 'rho/rhocontroller'
require 'helpers/browser_helper'

class WordController < Rho::RhoController
  include BrowserHelper

  def index
    render :action => :index
  end

  def search
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

