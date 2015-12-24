class AddSubscriptionToExistingUsers < ActiveRecord::Migration
  def up
    User.all.each do |u|
      u.create_subscription
    end
  end
end
