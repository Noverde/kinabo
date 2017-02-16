module Bradesco
  class RemessaMock
    class << self
      def header
        {
          data_gravacao: '070217',
          sequencial: '7896'
        }
      end

      def boletos
        [boleto]
      end

      def boleto
        {
          transacao: transacao,
          mensagem: mensagem,
          pagador: pagador
        }
      end

      def transacao
        {
          numero_documento: '23273 - 1 ',
          data_vencimento: '100317',
          valor: 530949,
          data_emissao: '070217',
          nome_pagador: 'SACADO',
          endereco_pagador: 'R TESTE         808  S 03',
          cep: '58010180',
          tipo_inscricao_pagador: 2,
          inscricao_pagador: '9472744000172',
          mensagem_2: '002696282000120  SACADOR AVALISTA',
          numero_controle: '1113978      01 01 00001',
          valor_mora: '1593',
          nosso_numero: '20000348757',
          nosso_numero_dv: '1'
        }
      end

      def mensagem
        {
          mensagem_1: 'PAGAVEL EM QUALQUER BANCO ATE O VENCIMENTO, APOS O VENCIMENTO COBRAR JUROS 9%AM.',
          mensagem_2: ' APOS 3 DIAS DO VENCIMENTO, SERÁ ENCAMINHADO PARA PROTESTO                     .',
          mensagem_3: ' COMUNICAMOS P/ FINS DO ART.290 DO COD CIVIL QUE ADQUIRIMOS ESTE TITULO        .',
          mensagem_4: ' ATRAVÉS DE CESSÃO                                                             .',
          nosso_numero: '20000348757',
          nosso_numero_dv: '1',
        }
      end

      def pagador
        {
          endereco: 'ENDERECO SACADOR     - AREIAS',
          cep: '50781000',
          cidade: 'RECIFE',
          uf: 'PE',
          nosso_numero: '20000348757',
          nosso_numero_dv: '1',
        }
      end
    end
  end
end
