class FeedbacksController < ApplicationController
  def index
  @events = Event.all
  end
end
