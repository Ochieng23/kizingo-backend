class Staff < ApplicationRecord
    has_many :constructionsites_workers
    has_many :construction_sites, through: :constructionsites_workers
end
