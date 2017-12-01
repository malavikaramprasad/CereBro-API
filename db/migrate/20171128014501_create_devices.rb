class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :user
      t.string :token
      t.string :uid
      t.string :os_version
      t.string :platform

      t.timestamps
    end
  end
end
