require 'spec_helper'

describe 'routes for Todos' do
  specify { expect(get('/active')).to route_to('todos#index', scope: 'active') }
  specify { expect(get('/completed')).to route_to('todos#index', scope: 'completed') }
  specify { expect(get('/todos/1')).not_to route_to('todos#show', id: '1') }
end
