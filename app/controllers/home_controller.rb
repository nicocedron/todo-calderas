class HomeController < ApplicationController
  expose :slides, -> { Slide.ordered }
  def index; end
end
