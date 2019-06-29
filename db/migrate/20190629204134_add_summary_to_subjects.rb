class AddSummaryToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :summary, :string
  end
end
