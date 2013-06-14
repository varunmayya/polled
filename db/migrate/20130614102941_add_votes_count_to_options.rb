class AddVotesCountToOptions < ActiveRecord::Migration
  def self.up
     add_column :options, :votes_count, :integer, :default => 0
     Option.find_each do |option|
       option.votes_count = option.votes.length
       option.save
     end
  end

  def self.down
    remove_column :options, :votes_count
  end
end
