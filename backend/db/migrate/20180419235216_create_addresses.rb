class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :address
      t.float :latitude
      t.float :longitude
      t.belongs_to :coverage_type, foreign_key: true
      t.timestamps
    end
  end
end
