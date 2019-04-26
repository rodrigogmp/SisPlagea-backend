class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.integer :studant_id
      t.integer :subject_id
      t.string :file_to_upload
      t.timestamps
    end
    
  end
end
