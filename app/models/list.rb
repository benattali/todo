class List < ApplicationRecord
	has_many :tasks, -> { order "description asc" }, inverse_of: :list, dependent: :destroy
	accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
	belongs_to :user

	validates :title, presence: true
end
