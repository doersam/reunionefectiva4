class MeetingsController < ApplicationController
  before_action :find_team
  before_action :find_organization

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(parms[:id])
  end

  def new
    @meeting = Meeting.new
     if find_team
      @meeting.team = find_team
    else
    end


  end

  def create

  end

  def edit

  end
  def update

  end
  def destroy

  end


  private

  def find_team

  end

  def find_organization
    @organization = Organization.find(params[:organization_id])
  end
end
