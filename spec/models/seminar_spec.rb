require 'spec_helper'

describe Seminar do
  it { should belong_to(:course) }
  it { should belong_to(:location) }
end