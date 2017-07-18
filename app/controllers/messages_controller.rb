class MessagesController < ApplicationController
  def index
    @group_id = params[:group_id]
    date = params[:created_at]
    @messages = nil
    start_date = params[:start_date]
    end_date = params[:end_date]
    if params[:created_at]
      date = date.to_datetime
      # binding.pry
      @messages = Message.where(:created_at => date.beginning_of_day..date.end_of_day)
    elsif params[:group_id]
      @messages = Message.where(group_id: @group_id)
    elsif params[:start_date]
      start_date = start_date.to_datetime
      end_date = end_date.to_datetime
      @messages = Message.where(:created_at => start_date.beginning_of_day..end_date.end_of_day)
    else
      @messages = Message.all
    end
    json_response(@messages)
  end

  def create
    @group_id = params[:group_id]
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end

  private

  def message_params
    params.permit(:content, :author, :id, :group_id)
  end
end
