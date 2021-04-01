class Friend < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    acts_as_paranoid
    has_many :books, dependent: :destroy
    accepts_nested_attributes_for :books, reject_if: :all_blank, allow_destroy: true
    
end
