require 'spec_helper'

describe LocationsController do
  it 'should have a valid #index' do
    get :index
    response.status.should eq(200)
  end
end