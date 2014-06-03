require 'spec_helper'

feature 'Todos' do
  it 'creates new todo and return to home page' do
    visit '/'
    fill_in 'Title', with: 'learn Swift'

    click_button('Create Todo')

    expect(current_path).to eq('/')
    expect(page).to have_content 'learn Swift'
  end

  describe 'with some todos' do
    before(:each) do
      Todo.create(title: 'to do', completed: false)
      Todo.create(title: 'done', completed: true)
    end

    it 'filters by all todos' do
      visit '/'

      click_link('All')

      expect(page).to have_content 'to do'
      expect(page).to have_content 'done'
    end

    it 'filters by active todos' do
      visit '/'

      click_link('Active')

      expect(page).to have_content 'to do'
      expect(page).not_to have_content 'done'
    end

    it 'filters by completed todos' do
      visit '/'

      click_link('Completed')

      expect(page).to have_content 'done'
      expect(page).not_to have_content 'to do'
    end
  end

  context 'with one active todo' do
    before(:each) do
      Todo.create(title: 'to do', completed: false)
    end

    it 'completes the todo with one click' do
      visit '/'

      click_button('mark as completed')

      expect(page).to have_content 'mark as active'
    end
  end

  context 'with one completed todo' do
    before(:each) do
      Todo.create(title: 'done', completed: true)
    end

    it 'actives the todo with one click' do
      visit '/'

      click_button('mark as active')

      expect(page).to have_content 'mark as completed'
    end
  end
end
