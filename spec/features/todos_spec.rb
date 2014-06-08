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

    it 'has item left counter on index page' do
      visit '/'

      expect(page).to have_content '1 item(s) left'
    end

    it 'has tr.completed class on completed todo' do
      visit '/'

      expect(page).to have_css('tr[1].completed')
      expect(page).not_to have_css('tr[2].completed')
    end

    it 'has no completed column in todos tables' do
      visit '/'

      expect(page).not_to have_css('thead th', text: 'Completed')
      expect(page).not_to have_css('tbody td', text: 'false')
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

  describe 'completed toggle button' do
    context 'with one active todo' do
      before(:each) do
        Todo.create(title: 'to do', completed: false)
      end

      it 'completes the todo with one click' do
        visit '/'
        click_button('mark as completed')
        visit '/'
        expect(page).to have_css('input[value="mark as active"]')
      end
    end

    context 'with one completed todo' do
      before(:each) do
        Todo.create(title: 'done', completed: true)
      end

      it 'actives the todo with one click' do
        visit '/'
        click_button('mark as active')
        visit '/'
        expect(page).to have_selector('input[value="mark as completed"]')
      end
    end
  end

  it 'redirects on index page after pressing on "mark as active"' do
    Todo.create(title: 'done', completed: true)
    visit '/'
    click_button('mark as active')
    expect(current_path).to eq('/')
  end

  it 'orders todos by created_at' do
    Todo.create(title: 'last')
    Todo.create(title: 'first')
    visit '/'
    expect(page).to have_css('tr[1] td', text: 'first')
    expect(page).to have_css('tr[2] td', text: 'last')
  end

  it 'has no show links colum' do
    Todo.create(title: 'foo')
    visit '/'
    expect(page).not_to have_css('td a', text: 'Show')
  end
end
