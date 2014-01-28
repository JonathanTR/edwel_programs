require 'spec_helper'

describe Seminar do
  it { should belong_to(:course) }
  it { should have_one(:location).through(:course) }
end