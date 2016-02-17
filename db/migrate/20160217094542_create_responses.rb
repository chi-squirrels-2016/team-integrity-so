class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.string :responsable_type
      t.integer :responsable_id
      t.integer :user_id
      t.timestamps(null: false)
    end
  end
end
