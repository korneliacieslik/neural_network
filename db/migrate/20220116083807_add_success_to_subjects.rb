class AddSuccessToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :success, :boolean
  end
end
