class User < ActiveRecord::Base
    has_many :adds, dependent: :destroy

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, presence:true, length: {minimum: 8}, on: :create

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
