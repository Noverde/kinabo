module Cnabs
  module Bradesco
    module Remessa
      class Trailler < Hashie::Dash
        include Cnabs::Utils

        def build
          parts = '9'

          parts << justify_string('', 393)
          parts << "%s"
        end
      end
    end
  end
end
