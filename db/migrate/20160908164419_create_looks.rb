class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.integer :user_id
      t.string :image_url
      t.string :quote
      t.datetime :expiration
      t.integer :type
    end
  end
end
