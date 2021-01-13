class DashboardController < ApplicationController
  def index
    @polls = Poll.all
  end
end
