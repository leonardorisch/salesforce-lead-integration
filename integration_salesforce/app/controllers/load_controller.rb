class LoadController < ApplicationController

  def create
  	user = User.new
  	@person = { name: params[:name], lastname: params[:lastname]  }
  end
end
