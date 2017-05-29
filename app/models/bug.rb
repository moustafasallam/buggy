require 'elasticsearch/model'

class Bug < ActiveRecord::Base
	include ActiveModel::Transitions
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	belongs_to :device

	state_machine do
    state :new
    state :in_progress
    state :closed

    event :start do
      transitions :to => :in_progress, :from => :new
    end

    event :close do
      transitions :to => :closed, :from => :in_progress
    end
  end

  def self.priorities
  	['minor', 'major', 'critical']
  end

end
Bug.import(force: true) # for auto sync model with elastic search