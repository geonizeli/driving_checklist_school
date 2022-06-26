class HomeController < ApplicationController
  def index
    @subscriptions = Subscription.accessible_by(current_ability)
  end
end
