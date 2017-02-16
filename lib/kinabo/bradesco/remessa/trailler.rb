module Kinabo
  module Bradesco
    module Remessa
      class Trailler < Hashie::Dash
        include Kinabo::Utils

        def build
          parts = '9'

          parts << justify_string('', 393)
        end
      end
    end
  end
end
