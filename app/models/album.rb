# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  album_type :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :band_id, :album_type, :title, presence: true
  validates :album_type, inclusion: { in: %w(live studio)}

  belongs_to :band
  has_many :tracks, dependent: :destroy


end
