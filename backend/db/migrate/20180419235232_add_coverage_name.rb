class AddCoverageName < ActiveRecord::Migration[5.2]
  def change
    add_column :coverage_types, :name, :string
  end
end
