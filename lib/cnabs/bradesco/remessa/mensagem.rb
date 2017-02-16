module Cnabs
  module Bradesco
    module Remessa
      class Mensagem < Hashie::Dash
        include Cnabs::Utils

        property :mensagem_1
        property :mensagem_2
        property :mensagem_3
        property :mensagem_4
        property :data_desconto_2
        property :valor_desconto_2
        property :data_desconto_3
        property :valor_desconto_3
        property :nosso_numero
        property :nosso_numero_dv


        def build
          parts = '2'

          parts << justify_string(mensagem_1, 80)
          parts << justify_string(mensagem_2, 80)
          parts << justify_string(mensagem_3, 80)
          parts << justify_string(mensagem_4, 80)
          parts << justify_number(data_desconto_2, 6)
          parts << justify_number(valor_desconto_2, 13)
          parts << justify_number(data_desconto_3, 6)
          parts << justify_number(valor_desconto_3, 13)
          parts << justify_string('', 7)
          parts << justify_number(carteira, 3)
          parts << justify_number(agencia, 5)
          parts << justify_number(conta_corrente, 7)
          parts << justify_string(conta_corrente_dv, 1)
          parts << justify_number(nosso_numero, 11)
          parts << justify_string(nosso_numero_dv, 1)

          parts << "%s" # sequencial
        end

        def carteira
          Cnabs.config.bradesco[:carteira]
        end

        def agencia
          Cnabs.config.bradesco[:agencia]
        end

        def conta_corrente
          Cnabs.config.bradesco[:conta_corrente].split('-')[0]
        end

        def conta_corrente_dv
          Cnabs.config.bradesco[:conta_corrente].split('-')[1]
        end
      end
    end
  end
end
