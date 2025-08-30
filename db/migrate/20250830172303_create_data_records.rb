class CreateDataRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :data_records do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :pan
      t.string :aadhaar
      t.boolean :is_sensitive

      t.timestamps
    end
  end
end
