class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :title
      t.string :content
      t.string :prefecture
      t.string :address
      t.string :price
      t.string :types
      t.text  :image


      t.timestamps
    end
  end
end
