class AddAddressForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, index: true
  end
end
