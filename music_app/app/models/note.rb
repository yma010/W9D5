# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  track_id   :integer          not null
#  user_id    :integer          not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
    validates :content, presence: true
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :track,
        foreign_key: :track_id,
        class_name: :Track
end
