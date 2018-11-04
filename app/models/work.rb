class Work < ApplicationRecord
	belongs_to :user

	has_one :due, dependent: :destroy
	accepts_nested_attributes_for :due, reject_if: :all_blank, allow_destroy: true



	include RailsSortable::Model
	set_sortable :sort
end
