class RemoveCastingFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :casting_id
  end
end
