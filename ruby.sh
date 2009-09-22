# instalacja wymaganych pakietów
sudo apt-get install build-essential zlib1g-dev libssl-dev \
libreadline5-dev libsqlite3-dev
# pobranie Rubiego w wersji 1.9.1
wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p243.tar.bz2
# rozpakowanie pliku
tar xjf ruby-1.9.1-p243.tar.bz2
# przejście do katalogu, kompilacja, instalacja
cd ruby-1.9.1-p243
./configure
make
sudo make install
