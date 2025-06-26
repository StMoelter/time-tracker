class Entry < ApplicationRecord
  belongs_to :project

  # Validierungen
  validates :date, :duration, :description, :project, presence: true
end
