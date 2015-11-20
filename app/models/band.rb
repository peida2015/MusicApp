# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, dependent: :destroy

  # def band_params
  #   params.require(band:).permit(:name)
  # end
end
