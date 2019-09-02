class Albums < ApplicationRecord
    validates :name, :year, presence: true
    validates :live, inclusion: {in: [true, false]}
    validates :name, uniqueness: {scope: :band_id}
    validates :year, numericality: { minimum: 1900, maximum: 9000}

    belongs_to :band

    has_many :tracks,
        dependent: :destroy

    after_intialize :set_defaults

    def set_defaults
        set.live ||= false
    end
end