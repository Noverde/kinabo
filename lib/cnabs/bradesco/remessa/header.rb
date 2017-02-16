module Cnabs
  module Bradesco
    module Remessa
      class Header < Hashie::Dash
        include Cnabs::Utils

        property :codigo_empresa, required: true, default: Cnabs.config.bradesco&.dig(:numero_empresa)
        property :nome_empresa, required: true, default: Cnabs.config.bradesco&.dig(:nome_empresa)
        property :data_gravacao, required: true
        property :sequencial, required: true

        def build
          parts = '01REMESSA01'

          parts << justify_string('COBRANCA', 15)
          parts << justify_number(codigo_empresa, 20)
          parts << justify_string(nome_empresa, 30)
          parts << '237'
          parts << justify_string('BRADESCO', 15)
          parts << justify_number(data_gravacao, 6)
          parts << justify_string('', 8)
          parts << 'MX'
          parts << justify_number(sequencial, 7)
          parts << justify_string('', 277)
        end
      end
    end
  end
end
