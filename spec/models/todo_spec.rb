require 'spec_helper'

describe Todo do
  it 'validates title presence' do
    todo = Todo.new(title: '')
    expect(todo.valid?).to eq(false)
  end

  describe 'scopes' do
    let!(:completed_todo) { Todo.create(title: 'done', completed: true) }
    let!(:active_todo) { Todo.create(title: 'to do', completed: false) }

    describe '.completed' do
      it 'returns just completed todos' do
        expect(Todo.completed).to eq [completed_todo]
      end
    end

    describe '.active' do
      it 'returns just active todos' do
        expect(Todo.active).to eq [active_todo]
      end
    end
  end
end
