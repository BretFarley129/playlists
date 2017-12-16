class Add < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates :amount, presence: true
  
  before_validation :set_defaults

  private
  def set_defaults
      self.amount = 0 unless self.amount
  end
end
