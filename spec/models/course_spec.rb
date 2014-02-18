require 'spec_helper'

describe Course do
  it { should validate_presence_of :title}
  it { should validate_uniqueness_of :title}
  it { should have_and_belong_to_many(:locations) }
  it { should have_and_belong_to_many(:instructors) }
  it { should have_many(:seminars) }
  it { should have_many(:content_blocks) }
  it { should accept_nested_attributes_for :content_blocks}
end