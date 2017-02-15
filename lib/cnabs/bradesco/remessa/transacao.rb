module Cnabs
  module Bradesco
    module Remessa
      class Transacao < Hashie::Dash
        include Cnabs::Utils

        property :agencia_debito

        def build
          parts = '1'

          parts << justify_number(agencia_debito, 5)
          parts << "%s"
        end
      end
    end
  end
end
