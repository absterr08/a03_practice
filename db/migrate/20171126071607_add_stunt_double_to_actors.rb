class AddStuntDoubleToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :stunt_double_id, :integer
  end
end
