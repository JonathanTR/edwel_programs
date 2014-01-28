require 'spec_helper'

describe Course do
  it { should validate_presence_of :title}
end