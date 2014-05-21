# Rails Todo App for MAS-RAD

## Setup on Nitrous.io

- Fork this repository to your Github account: https://help.github.com/articles/fork-a-repo
- Add you public ssh key to Github: http://help.nitrous.io/github-add-key
- $ parts install postgresql
- $ parts start postgresql
- $ git clone git@github.com:<your github name>/mas-rad-rails-app.git todo_app
- $ git config --global user.email <your email>
- $ git config --global user.name '<your name>'
- $ cd todo_app
- $ bundle install
- $ rake db:create db:migrate
- $ rails s

## Update your fork

- https://help.github.com/articles/syncing-a-fork
- $ git remote add upstream https://github.com/thibaudgg/thibaudgg/mas-rad-rails-app.git
- $ git fetch upstream
- $ git checkout master # or any branch
- $ git merge upstream/master
