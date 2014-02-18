require "spec_helper"

describe Instructor do
  it { should have_and_belong_to_many(:courses) }
end