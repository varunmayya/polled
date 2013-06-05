class AddUserNameToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :user_name, :string
  end
end
