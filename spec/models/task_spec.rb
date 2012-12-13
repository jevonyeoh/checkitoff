require 'spec_helper'

describe Task do
    it "requires a name" do
        subject.should_not be_valid
        subject.name = "my first task"
        subject.should be_valid
    end
end

