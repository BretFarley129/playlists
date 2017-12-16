class Song < ActiveRecord::Base
    has_many :adds, dependent: :destroy
  
    validates :title, :artist, presence: true, length: {minimum: 2}
    validates :total_adds, presence: true

    before_validation :set_defaults

    private
    def set_defaults
        self.total_adds = 0 unless self.total_adds
    end

        
end
