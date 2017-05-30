require 'rails_helper'

RSpec.describe Bug, type: :model do

  let(:bug)        {create(:bug)}

  describe "bug model" do

    it "after create expect bug number to be incremental" do
      expect(bug.number).to eq(bug.registered_app.serial)
    end

    it "can't set the priority to anything but ['minor', 'major', 'critical']" do
      bug.priority = "important"
      expect(bug.priority).to eq("minor")
    end

    it "can't close new bug" do
      expect { bug.close! }.to raise_error
    end

    it "when start a new bug the state changes to in_progress" do
      bug.start!
      expect(bug.state).to eq("in_progress")
    end

  end

end