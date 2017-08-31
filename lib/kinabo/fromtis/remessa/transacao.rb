module Kinabo
  module Fromtis
    module Remessa
      class Transacao < Hashie::Dash
        include Kinabo::Utils

        property :coobrigacao, required: true, default: 2
        property :caracteristica_especial
        property :modalidade_operacao
        property :natureza_operacao
        property :origem_recurso
        property :risco_operacao
        property :numero_controle, required: true
        property :codigo_banco_c3, default: '000'
        property :nosso_numero
        property :nosso_numero_dv
        property :valor_pago, required: true
        property :data_liquidacao
        property :ocorrencia, required: true
        property :numero_documento, required: true
        property :data_vencimento, required: true
        property :valor, required: true
        property :codigo_banco_cobranca
        property :agencia_depositaria
        property :especie, required: true, default: '01'
        property :data_emissao, required: true

        property :tipo_inscricao_cedente, required: true, default: '02'
        property :termo_cessao, required: true
        property :valor_parcela, required: true
        property :valor_abatimento
        property :tipo_inscricao_pagador, required: true, default: '01'
        property :inscricao_pagador, required: true
        property :nome_pagador, required: true
        property :endereco_pagador, required: true
        property :nota_fiscal
        property :serie_nota_fiscal
        property :cep_pagador, required: true
        property :cedente
        property :chave_nota_fiscal

        def build
          parts = '1'

          parts << justify_string('', 19)

          parts << justify_number(coobrigacao, 2)
          parts << justify_number(caracteristica_especial, 2)
          parts << justify_number(modalidade_operacao, 4)
          parts << justify_number(natureza_operacao, 2)
          parts << justify_number(origem_recurso, 4)
          parts << justify_number(risco_operacao, 2)

          parts << '0'

          parts << justify_string(numero_controle, 25)
          parts << justify_number(numero_banco, 3)

          parts << '00000'

          parts << justify_number(nosso_numero, 11)
          parts << justify_string(nosso_numero_dv, 1)
          parts << justify_number(valor_pago, 10)

          parts << '0 '

          parts << justify_number(data_liquidacao, 6)

          parts << '     0  '

          parts << justify_number(ocorrencia, 2)
          parts << justify_string(numero_documento, 10)
          parts << justify_number(data_vencimento, 6)
          parts << justify_number(valor, 13)
          parts << justify_number(codigo_banco_cobranca, 3)
          parts << justify_number(agencia_depositaria, 5)
          parts << justify_number(especie, 2)

          parts << ' '

          parts << justify_number(data_emissao, 6)

          parts << '000'

          parts << justify_string(tipo_inscricao_cedente, 2)

          parts << '00000000000'

          parts << justify_string(termo_cessao, 19)
          parts << justify_number(valor_parcela, 13)
          parts << justify_number(valor_abatimento, 13)

          parts << justify_number(tipo_inscricao_pagador, 2)
          parts << justify_number(inscricao_pagador, 14)
          parts << justify_string(nome_pagador, 40)
          parts << justify_string(endereco_pagador, 40)

          parts << justify_string(nota_fiscal, 9)
          parts << justify_string(serie_nota_fiscal, 3)

          parts << justify_number(cep_pagador, 8)
          parts << justify_string(cedente, 60)
          parts << justify_string(chave_nota_fiscal, 44)
        end
      end
    end
  end
end
