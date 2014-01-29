require 'spec_helper'

describe LocationsController do
  it 'should have a valid #index route' do
    get :index
    response.status.should eq(200)
  end

  it 'should have a valid #show route' do
    chicago = Location.create(name: 'Chicago')
    get :show, id: chicago.slug
    response.status.should eq(200)
  end
end