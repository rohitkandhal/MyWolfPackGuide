class AddUserInterestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_interest, :text
  end
end
