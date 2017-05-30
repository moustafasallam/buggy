require 'elasticsearch/model'

class Bug < ActiveRecord::Base
	include ActiveModel::Transitions
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	belongs_to :registered_app
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

  def priority=(value)
    value = Bug.priorities.include?(value.to_s.downcase) ? value.to_s.downcase : 'minor'
    super(value)
  end

  def as_indexed_json(options={})
    as_json(
      only: [:id, :number, :priority, :state, :comment],
      include: [:registered_app, :device]
    )
  end

end