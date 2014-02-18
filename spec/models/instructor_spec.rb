require "spec_helper"

describe Instructor do
  it { should belong_to(:course) }
end