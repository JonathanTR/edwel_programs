require 'spec_helper'

describe Seminar do
  it { should belong_to(:course)}
end