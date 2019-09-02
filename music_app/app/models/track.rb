# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
    validates :lyrics, :name, :ord, presence: true
    validates :bonus, inclusion: { in: [true, false]}
    validates :ord, uniqueness: { scope: :album_id}

    belongs_to :album

    has_one :band, 
        through: :album, 
        source: :band

    has_many :notes,
        dependent: :destroy

    after_initialize :set_defaults
    
    def set_defaults
        self.bonus ||=false
    end

end
