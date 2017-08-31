module Fromtis
  class RemessaMock
    class << self
      def header
        {
          data_gravacao: '190717',
          sequencial: '1'
        }
      end

      def transacoes
        [transacao]
      end

      def transacao
        {
          nosso_numero_dv: 0,
          natureza_operacao: 11, # SRC3040 Anexo 2
          numero_controle: '000000023660999007',
          valor_pago: '34875',
          data_liquidacao: '190717',
          ocorrencia: 77,
          numero_documento: '0023660999',
          data_vencimento: '050717',
          valor: '33426',
          data_emissao: '010116',
          valor_parcela: '33426',
          inscricao_pagador: '30691232288',
          nome_pagador: 'Rogerio Oliveira Santo',
          codigo_banco_cobranca: '237'
        }
      end
    end
  end
end
