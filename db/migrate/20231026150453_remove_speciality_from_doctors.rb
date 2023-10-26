class RemoveSpecialityFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :speciality
  end
end
