class MessagesController < ApplicationController
  def index
    @group_id = params[:group_id]
    date = params[:created_at]
    @messages = nil
    if params[:created_at]
      date.to_datetime
      @messages = Message.where(created_at: date)
    elsif params[:group_id]
      @messages = Message.where(group_id: @group_id)
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
    params.permit(:content, :author, :id, :group_id, :created_at)
  end
end
