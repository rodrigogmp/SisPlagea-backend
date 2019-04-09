class AddProjectIdToStudants < ActiveRecord::Migration[5.2]
  def change
    add_column :studants, :project_id, :integer
  end
end
