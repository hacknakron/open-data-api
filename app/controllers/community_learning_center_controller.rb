class CommunityLearningCenterController < ApplicationController
  def index
    @community_learning_centers = CommunityLearningCenter.all

    render json: @community_learning_centers
  end
end
