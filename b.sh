docker-compose build
docker-compose run rails_mysql bundle install && bundle update && yarn install && yarn upgrade
docker-compose run rails_mysql rails db:create && rails db:migrate
