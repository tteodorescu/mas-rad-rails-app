require 'spec_helper'

describe Todo do
  it 'validates title presence' do
    todo = Todo.new(title: '')
    expect(todo.valid?).to eq(false)
  end
end
