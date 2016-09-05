require 'rails_helper'

RSpec.describe EmploymentCentersController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/employment_centers').to route_to('employment_centers#index')
    end

    it 'routes to #new' do
      expect(get: '/employment_centers/new').to route_to('employment_centers#new')
    end

    it 'routes to #show' do
      expect(get: '/employment_centers/1').to route_to('employment_centers#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(get: '/employment_centers/1/edit').to route_to('employment_centers#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(post: '/employment_centers').to route_to('employment_centers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/employment_centers/1').to route_to('employment_centers#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/employment_centers/1').to route_to('employment_centers#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/employment_centers/1').to route_to('employment_centers#destroy', :id => '1')
    end

  end
end
