class CreateUrl < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :clicked
      t.timestamps
    end
  end
end
