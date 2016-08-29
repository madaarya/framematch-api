class CreateProps < ActiveRecord::Migration[5.0]
  def change
    create_table :props do |t|
      t.string :prop_uid
      t.string :title
      t.boolean :prop_public, default: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_column :frames, :frame_public, :boolean, default: true
  end
end
