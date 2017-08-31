module Kinabo
  module Fromtis
    module Remessa
      class Trailler < Hashie::Dash
        include Kinabo::Utils

        def build
          parts = '9'

          parts << justify_string('', 393)
          parts << justify_string('', 44) # Put more 44 because it is a CNAB 444
        end
      end
    end
  end
end
