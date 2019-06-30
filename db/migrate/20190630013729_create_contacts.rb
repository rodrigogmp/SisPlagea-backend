class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :subject
      t.string :message
      t.string :file_to_upload
      t.timestamps
    end
  end
end
