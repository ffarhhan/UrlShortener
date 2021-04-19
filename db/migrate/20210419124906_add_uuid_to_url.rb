class AddUuidToUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :uuid, :string
  end
end
