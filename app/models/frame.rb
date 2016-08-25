class Frame < ApplicationRecord
  belongs_to :user
  dragonfly_accessor :frame

  validates :frame, presence: true
  validates_property :format, of: :frame, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: "should be either .jpeg, .jpg, .png, .bmp", if: :frame_changed?
end