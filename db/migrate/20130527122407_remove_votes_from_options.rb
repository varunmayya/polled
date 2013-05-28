class RemoveVotesFromOptions < ActiveRecord::Migration
  def up
    remove_column :options, :votes
  end

  def down
    add_column :options, :votes, :integer
  end
end
