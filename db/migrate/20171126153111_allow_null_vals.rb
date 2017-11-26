class AllowNullVals < ActiveRecord::Migration[5.1]
  def change
    change_column :actors, :stunt_double_id, :integer, :null => true
    change_column :producers, :production_company_id, :integer, :null => true
  end
end
