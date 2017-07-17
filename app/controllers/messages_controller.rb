class MessagesController < ApplicationController
  def index
    @group_id = params[:group_id]
    @messages = Message.where(group_id: @group_id)
    json_response(@messages)
  end

  private

  def message_params
    params.permit(:content, :author, :id, :group_id)
  end
end
