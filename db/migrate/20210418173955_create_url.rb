class CreateUrl < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.integer :clicked, default: 0
      t.string :shorten_url
      t.timestamps
    end
  end
end
