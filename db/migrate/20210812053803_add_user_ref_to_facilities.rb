class AddUserRefToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_reference :facilities, :user, foreign_key: true
  end
end
