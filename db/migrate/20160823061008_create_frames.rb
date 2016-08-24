class CreateFrames < ActiveRecord::Migration[5.0]
  def change
    create_table :frames do |t|
      t.string :title
      t.string :frame_uid
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
