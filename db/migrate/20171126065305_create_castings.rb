class CreateCastings < ActiveRecord::Migration[5.1]
  def change
    create_table :castings do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
