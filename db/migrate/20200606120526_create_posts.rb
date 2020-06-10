class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :position
      t.string :company
      t.string :location
      t.string :length
      t.string :jobLink
      t.string :instagram
      t.string :facebook
      t.string :description
      t.boolean :accepted

      t.timestamps
    end
  end
end
