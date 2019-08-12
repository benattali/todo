class List < ApplicationRecord
	has_many :tasks, -> { order "description asc" }, inverse_of: :list, dependent: :destroy
	accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

	validates :title, presence: true
end
