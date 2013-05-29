class AddCityToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :city, :string
  end
end
