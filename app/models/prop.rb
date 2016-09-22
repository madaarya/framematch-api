class Prop < ApplicationRecord
  belongs_to :user
  dragonfly_accessor :prop

  validates :prop, presence: true
  validates_property :format, of: :prop, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: "should be either .jpeg, .jpg, .png, .bmp", if: :frame_changed?
end
