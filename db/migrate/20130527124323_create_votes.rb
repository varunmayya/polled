class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :option_id
      t.string :location
      t.timestamp :time
      t.string :os
      t.string :browser

      t.timestamps
    end
  end
end
