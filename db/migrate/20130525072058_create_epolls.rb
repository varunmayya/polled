class CreateEpolls < ActiveRecord::Migration
  def change
    create_table :epolls do |t|
      t.string :question
      t.timestamp :timeout
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
