class Bug < ActiveRecord::Base
	include ActiveRecord::Transitions

	belongs_to :state

	state_machine :status => :different_column do
    state :new
    state :in_progress
    state :closed

    event :start do
      transitions :to => :in_progress, :from => :new
    end

    event :end do
      transitions :to => :closed, :from => :in_progress
    end
  end

  def self.priorities
  	['minor', 'major', 'critical']
  end

end
