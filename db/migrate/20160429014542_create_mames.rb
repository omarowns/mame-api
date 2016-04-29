class CreateMames < ActiveRecord::Migration[5.0]
  def change
    create_table :mames do |t|
      t.string :text
      t.string :author

      t.timestamps
    end
  end
end
