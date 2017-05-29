class Device < ActiveRecord::Base
	has_one :bug, dependent: :destroy
end