class AddIsMobileToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :is_mobile, :boolean
  end
end
