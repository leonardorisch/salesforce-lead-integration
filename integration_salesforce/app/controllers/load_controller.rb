require 'importlead'
class LoadController < ApplicationController
  def index
  	hello = ImportLead.new
  	puts hello.say
  end

  def create
  	@person = { name: params[:name] }
  end
end
