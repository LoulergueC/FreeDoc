class UpdatePatientsFirstName < ActiveRecord::Migration[7.1]
  def change
    rename_column :patients, :frist_name, :first_name
  end
end
