# instalacja Ruby on Rails 2.3.3
sudo gem install rails -v 2.3.3
# instalacja dowiązań do bazy danych SQLite3
sudo gem install sqlite3-ruby
# instalacja biblioteki test-unit
sudo gem install test-unit
# dodanie serwera GitHub do dostępnych źródeł
gem sources -a http://gems.github.com
# skopiowanie przykładowej konfiguracji
cp config/database.yml.sample config/database.yml
# instalacja używanych gemów
sudo rake gems:install RAILS_ENV=test
# utworzenie bazy danych
rake db:schema:load
# załadowanie przykładowych danych
rake db:seed
# uruchomienie testów
rake test
