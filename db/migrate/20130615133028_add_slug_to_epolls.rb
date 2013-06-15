class AddSlugToEpolls < ActiveRecord::Migration
  def change
    add_column :epolls, :slug, :string
    add_index :epolls, :slug
  end
end
