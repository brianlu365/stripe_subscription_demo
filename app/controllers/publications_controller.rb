class PublicationsController < ApplicationController
  before_action :find_publication, only: [:show]
  before_action :check_for_subscription, only: [:show]

  def index
    @publications = Publication.all
  end

  def show
  end



  private
  def check_for_subscription
    unless current_user.subscription.active
      redirect_to publications_path, alert: 'You must be subscribed to access this content.'
    end
  end

  def find_publication
    @publication = Publication.find(params[:id])
  end
end