
class WelcomeController < ApplicationController
  def index
  	puts File.join(
          File.dirname(__FILE__) + '../',
          "foo", "bar")
  end
end
