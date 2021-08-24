class ChangeDatatyPeprefectureofFacility < ActiveRecord::Migration[5.2]
  def change
     change_column :facilities, :prefecture, :'integer USING CAST(prefecture AS integer)'
  end
end
