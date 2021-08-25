class ChangeDatatypePrefectureofFacility < ActiveRecord::Migration[5.2]
  def change
    change_column :facilities, :prefecture, :string
  end
end
