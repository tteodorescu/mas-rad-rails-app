require 'spec_helper'

describe 'routes for Todos', :type => :routing do
  specify { expect(get('/active')).to route_to('todos#index', scope: 'active') }
  specify { expect(get('/completed')).to route_to('todos#index', scope: 'completed') }
end
