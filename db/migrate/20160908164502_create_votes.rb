class CreateVotes < ActiveRecord::Migration
  create_table :votes do |t|
    t.integer :user_id
    t.string :quote
    t.datetime :expiration
    t.boolean :value
  end
end
