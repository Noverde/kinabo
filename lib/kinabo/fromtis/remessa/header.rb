module Kinabo
  module Fromtis
    module Remessa
      class Header < Hashie::Dash
        include Kinabo::Utils

        property :codigo_empresa, required: true, default: Kinabo.config.fromtis&.dig(:convenio)
        property :nome_empresa, required: true, default: Kinabo.config.fromtis&.dig(:nome_empresa)
        property :codigo_banco, required: true, default: Kinabo.config.fromtis&.dig(:codigo_banco)
        property :nome_banco, required: true, default: Kinabo.config.fromtis&.dig(:nome_banco)
        property :data_gravacao, required: true
        property :sequencial, required: true

        def build
          parts = '01REMESSA01'

          parts << justify_string('COBRANCA', 15)
          parts << justify_string(codigo_empresa, 20)
          parts << justify_string(nome_empresa, 30)
          parts << justify_number(codigo_banco, 3)
          parts << justify_string(nome_banco, 15)
          parts << justify_number(data_gravacao, 6)
          parts << justify_string('', 8)
          parts << 'MX'
          parts << justify_number(sequencial, 7)
          parts << justify_string('', 277)
          parts << justify_string('', 44) # Put more 44 because it is a CNAB 444
        end
      end
    end
  end
end
