require 'spec_helper'

describe Course do
  it { should validate_presence_of :title}
  it { should validate_uniqueness_of :title}
  it { should have_and_belong_to_many(:locations) }
  it { should have_many(:seminars) }
end