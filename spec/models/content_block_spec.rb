require "spec_helper"

describe ContentBlock do
  it { should belong_to(:course) }
end