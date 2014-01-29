require 'spec_helper'

describe Seminar do
  it { should belong_to(:course) }
  it { should belong_to(:location) }

  it 'should be able to add a course' do
    pmp = Course.create(title: 'PMP')
    atlanta_feb_pmp = Seminar.create(name: 'Atlanta February PMP')
    atlanta_feb_pmp.course = pmp
    expect(atlanta_feb_pmp.course).to eq(pmp)
  end
end