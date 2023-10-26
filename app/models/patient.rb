class Patient < ApplicationRecord
    has_many :appointments
    has_many :docotrs, through: :appointments
    belongs_to :city
end
