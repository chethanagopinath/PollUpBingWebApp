class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
  
  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'New poll was created successfully!'
      redirect_to dashboard_index_path
    else
      render 'new'
    end
  end


  def poll_params
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
  
  def edit
    @poll = Poll.find(params[:id])
    render 'edit'
  end

  def update
    @poll = Poll.find(params[:id])
    if @poll.update(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to dashboard_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @poll = Poll.find_by_id(params[:id])
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to dashboard_index_path
  end
end