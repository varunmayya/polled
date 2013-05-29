class AddEpollIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :epoll_id, :integer
  end
end
