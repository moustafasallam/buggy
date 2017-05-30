class RegisteredApp < ActiveRecord::Base
	has_many :bugs, dependent: :destroy

  validates :token, presence: true
  validates :token, uniqueness: { case_sensitive: false }

  def update_serial
		self.with_lock do
			self.serial += 1
			self.save!
		end
  end

end