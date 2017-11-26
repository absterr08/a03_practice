class CreateAllegations < ActiveRecord::Migration[5.1]
  def change
    create_table :allegations do |t|
      t.integer :accuser_id
      t.integer :accusee_id

      t.timestamps
    end
  end
end
