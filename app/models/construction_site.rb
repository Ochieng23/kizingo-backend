class ConstructionSite < ApplicationRecord
    has_many :constructionsites_workers
    has_many :staff, through: :constructionsites_workers
end
