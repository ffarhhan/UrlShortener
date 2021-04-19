class AddAddressTable < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :ip_address
      t.references :url, index: true, foreign_key: true
      t.timestamps
    end
  end
end
