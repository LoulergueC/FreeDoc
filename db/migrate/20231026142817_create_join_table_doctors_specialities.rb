class CreateJoinTableDoctorsSpecialities < ActiveRecord::Migration[7.1]
  def change
    create_table :join_table_doctors_specialities do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :speciality, index: true
    end
  end
end
