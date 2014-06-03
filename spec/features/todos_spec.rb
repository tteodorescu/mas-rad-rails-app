require 'spec_helper'

feature 'Todos' do
  it 'creates new todo and return to home page' do
    visit '/'
    fill_in 'Title', with: 'learn Swift'

    click_button('Create Todo')

    expect(current_path).to eq('/')
    expect(page).to have_content 'learn Swift'
  end
end
