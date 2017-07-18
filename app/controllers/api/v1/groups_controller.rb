module Api::V1
  class GroupsController < ApiController
    def index
      @groups = Group.all
      json_response(@groups)
    end

    def show
      @group = Group.find(params[:id])
      json_response(@group)
    end

    private

    def message_params
      params.permit(:name, :id)
    end
  end
end
