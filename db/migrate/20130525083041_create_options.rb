class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.integer :votes
      t.belongs_to :epoll

      t.timestamps
    end
    add_index :options, :epoll_id
  end
end
