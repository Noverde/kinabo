module Cnabs
  module Bradesco
    module Remessa
      class Transacao < Hashie::Dash
        include Cnabs::Utils

        property :agencia_debito, default: '00000'
        property :agencia_debito_dv, default: '0'
        property :razao_cc_pagador, default: '00000'
        property :cc_pagador, default: '0000000'
        property :cc_pagador_dv, default: '0'
        property :numero_controle
        property :codigo_banco_c3, default: '000'
        property :campo_multa
        property :percentual_multa
        property :nosso_numero
        property :nosso_numero_dv
        property :desconto_por_dia
        property :emissao, default: 1
        property :debito_automatico, default: 'N'
        property :rateio
        property :aviso_debito_automatico, default: '2'
        property :ocorrencia, required: true, default: 1
        property :numero_documento, required: true
        property :data_vencimento, required: true
        property :valor, required: true
        property :especie, required: true, default: 1
        property :data_emissao, required: true
        property :instrucao_1
        property :instrucao_2
        property :valor_mora
        property :data_limite_desconto
        property :valor_desconto
        property :valor_iof
        property :valor_abatimento
        property :tipo_inscricao_pagador, required: true, default: 1
        property :inscricao_pagador, required: true
        property :nome_pagador, required: true
        property :endereco_pagador, required: true
        property :mensagem_1
        property :cep, required: true
        property :mensagem_2

        def build
          parts = '1'

          parts << justify_number(agencia_debito, 5)
          parts << justify_string(agencia_debito_dv, 1)
          parts << justify_string(razao_cc_pagador, 5)
          parts << justify_number(cc_pagador, 7)
          parts << justify_string(cc_pagador_dv, 1)
          parts << justify_string(id_empresa, 17)
          parts << justify_string(numero_controle, 25)
          parts << justify_number(codigo_banco_c3, 3)
          parts << justify_number(campo_multa, 1)
          parts << justify_number(percentual_multa, 4)
          parts << justify_number(nosso_numero, 11)
          parts << justify_string(nosso_numero_dv, 1)
          parts << justify_number(desconto_por_dia, 10)
          parts << justify_string(emissao, 1)
          parts << justify_string(debito_automatico, 1)
          parts << justify_string('', 10)
          parts << justify_string(rateio, 1)
          parts << justify_number(aviso_debito_automatico, 1)
          parts << justify_string('', 2)
          parts << justify_number(ocorrencia, 2)
          parts << justify_string(numero_documento, 10)
          parts << justify_number(data_vencimento, 6)
          parts << justify_number(valor, 13)
          parts << '00000000'
          parts << justify_number(especie, 2)
          parts << 'N'
          parts << justify_number(data_emissao, 6)
          parts << justify_number(instrucao_1, 2)
          parts << justify_number(instrucao_2, 2)
          parts << justify_number(valor_mora, 13)
          parts << justify_number(data_limite_desconto, 6)
          parts << justify_number(valor_desconto, 13)
          parts << justify_number(valor_iof, 13)
          parts << justify_number(valor_abatimento, 13)
          parts << justify_number(tipo_inscricao_pagador, 2)
          parts << justify_number(inscricao_pagador, 14)
          parts << justify_string(nome_pagador, 40)
          parts << justify_string(endereco_pagador, 40)
          parts << justify_string(mensagem_1, 12)
          parts << justify_number(cep_pagador, 5)
          parts << justify_number(cep_sufixo_pagador, 3)
          parts << justify_string(mensagem_2, 60)
        end

        def id_empresa
          parts = '0'
          parts << justify_number(carteira, 3)
          parts << justify_number(agencia, 5)
          parts << justify_number(conta_corrente, 7)
          parts << justify_number(conta_corrente_dv, 1)
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
