class CreateCoverageTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :coverage_types do |t|

      t.timestamps
    end
  end
end
