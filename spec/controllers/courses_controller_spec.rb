require 'spec_helper'

describe CoursesController do
  it 'should have a valid #show route' do
    chicago = Location.create(name: 'Chicago')
    pmp = Course.create(title: 'pmp', locations: [chicago])
    get :show, location_id: pmp.locations.first.slug, id: pmp.slug
    response.status.should eq(200)
  end
end