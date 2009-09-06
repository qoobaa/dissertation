class User < ActiveRecord::Base
  acts_as_authentic
end

class UserSession < Authlogic::Session::Base
end

# Utworzenie użytkownika bjohnson
User.create(:login => "bjohnson",
            :password => "my password",
            :password_confirmation => "my password",
            :email => "bjohnson@example.com")


# Utworzenie sesji użytkownika na podstawie nazwy
# użytkownika i hasła
UserSession.create(:login => "bjohnson",
                   :password => "my password",
                   :remember_me => true)

# Odnalezienie sesji na podstawie danych zawartych
# w żądaniu HTTP
session = UserSession.find

# Wylogowanie użytkownika, usunięcie informacji
# o sesji
session.destroy
