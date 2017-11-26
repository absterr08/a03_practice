class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :director_id
      t.integer :producer_id
      t.integer :casting_id

      t.timestamps
    end
  end
end
