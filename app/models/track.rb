# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  track_type :string           not null
#  lyric      :text
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  validates :album_id, :track_type, :title, presence: true
  validates :track_type, inclusion: { in: %w(bonus regular) }

  belongs_to :album


end
