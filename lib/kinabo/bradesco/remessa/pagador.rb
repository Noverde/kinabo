module Kinabo
  module Bradesco
    module Remessa
      class Pagador < Hashie::Dash
        include Kinabo::Utils

        property :endereco
        property :cep
        property :cidade
        property :uf
        property :nosso_numero
        property :nosso_numero_dv

        def build
          parts = '7'

          parts << justify_string(endereco, 45)
          parts << justify_number(cep_pagador, 5)
          parts << justify_number(cep_sufixo_pagador, 3)
          parts << justify_string(cidade, 20)
          parts << justify_string(uf, 2)
          parts << justify_string('', 290)
          parts << justify_number(carteira, 3)
          parts << justify_number(agencia, 5)
          parts << justify_number(conta_corrente, 7)
          parts << justify_string(conta_corrente_dv, 1)
          parts << justify_number(nosso_numero, 11)
          parts << justify_string(nosso_numero_dv, 1)
        end

        def carteira
          Kinabo.config.bradesco[:carteira]
        end

        def agencia
          Kinabo.config.bradesco[:agencia]
        end

        def conta_corrente
          Kinabo.config.bradesco[:conta_corrente].split('-')[0]
        end

        def conta_corrente_dv
          Kinabo.config.bradesco[:conta_corrente].split('-')[1]
        end

        def cep_pagador
          cep[0..4]
        end

        def cep_sufixo_pagador
          cep[-3..-1]
        end
      end
    end
  end
end
