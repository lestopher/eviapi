module Eviapi
  class Client
    module Mapsweb
      module Password
        # Clients can request a list of abilities of the authenticated user.
        def abilities_get(input={}, raw=false)
          response = get('mw/Password.Abilities.Get', input, raw)
        end

        # Clients can generate a random password adhering to the rules
        # defined by the MAPS Administrator
        def random(input={}, raw=false)
          response = post('mw/Password.Random', input, raw)
        end

        # Clients can request a list of rules (defined by the MAPS
        # Administrator) that a valid password must adhere to.
        def rules(input={}, raw=false)
          response = get('mw/Password.Rules', input, raw)
        end

        # A user will sometimes want to alter their password used to log in
        # to MAPS.  The server can reject the changing of a password for a
        # variety of reasons including invalid old value, invalid new value,
        # administrator is disallowing password changes, etc.
        #
        # input.OldValue        String
        # input.NewValue        String
        def set(input={}, raw=false)
          response = post('mw/Password.Set', input, raw)
        end

        # Clients can verify a password before submitting it.  This leads to
        # a better user interface and also allows for password strength to
        # be controlled by MAPS.
        #
        # input.Password        String
        def test(input={}, raw=false)
          response = post('mw/Password.Test', input, raw)
        end
        
        alias_method :password_abilities_get, :abilities_get
        alias_method :password_random, :random
        alias_method :password_rules, :rules
        alias_method :password_set, :set
      end
    end
  end
end