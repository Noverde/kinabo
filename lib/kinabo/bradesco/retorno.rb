module Kinabo
  module Bradesco
    class Retorno
      include Kinabo::Utils

      def initialize(path)
        @path = path
      end

      def lines
        @lines ||= content.split("\n")
      end

      def header
        header_line = lines.first

        {
          id_registro: parse_number(pos(header_line, '1-1')),
          id_arquivo_retorno: parse_number(pos(header_line, '2-2')),
          literal_retorno: parse_string(pos(header_line, '3-9')),
          codigo_servico: parse_number(pos(header_line, '10-11')),
          literal_servico: parse_string(pos(header_line, '12-26')),
          codigo_empresa: parse_number(pos(header_line, '27-46')),
          nome_empresa: parse_string(pos(header_line, '47-76')),
          numero_bradesco_c3: parse_number(pos(header_line, '77-79')),
          nome_banco: parse_string(pos(header_line, '80-94')),
          data_gravacao_arquivo: parse_date(pos(header_line, '95-100')),
          densidade_gravacao: parse_number(pos(header_line, '101-108')),
          numero_aviso_bancario: parse_number(pos(header_line, '109-113')),
          data_credito: parse_date(pos(header_line, '380-385')),
          numero_sequencial: parse_number(pos(header_line, '395-400'))
        }
      end

      def trailler
        trailler_line = @lines.last

        {
          id_registro: pos(trailler_line, '1-1'),
          id_retorno: pos(trailler_line, '2-2'),
          id_tipo_registro: pos(trailler_line, '3-4'),
          codigo_banco: pos(trailler_line, '5-7'),
          quantidade_titulos_cobranca: pos(trailler_line, '18-25'),
          valor_total_cobranca: pos(trailler_line, '26-39'),
          numero_aviso_bancario: pos(trailler_line, '40-47')
        }
      end

      def entries
        entries_lines = lines[1...-1]

        entries_lines.map do |entry_line|
          {
            id_registro: parse_number(pos(entry_line, '1-1')),
            tipo_empresa: parse_number(pos(entry_line, '2-3')),
            numero_empresa: parse_number(pos(entry_line, '4-17')),
            id_empresa: parse_number(pos(entry_line, '21-37')),
            numero_controle: parse_number(pos(entry_line, '38-62')),
            nosso_numero: pos(entry_line, '71-82'),
            indicador_rateio: pos(entry_line, '105-105'),
            carteira: parse_number(pos(entry_line, '108-108')),
            id_ocorrencia: parse_number(pos(entry_line, '109-110')),
            data_ocorrencia: parse_date(pos(entry_line, '111-116')),
            numero_documento: parse_string(pos(entry_line, '117-126')),
            data_vencimento: parse_date(pos(entry_line, '147-152')),
            valor: parse_decimal(pos(entry_line, '153-165')),
            banco_cobrador: parse_number(pos(entry_line, '166-168')),
            agencia_cobradora: parse_number(pos(entry_line, '169-173')),
            especie_titulo: parse_string(pos(entry_line, '174-175')),
            despesas_cobranca: parse_decimal(pos(entry_line, '176-188')),
            outras_despesas: parse_decimal(pos(entry_line, '189-201')),
            juros_operacao: parse_decimal(pos(entry_line, '202-214')),
            iof: parse_decimal(pos(entry_line, '215-227')),
            abatimento: parse_decimal(pos(entry_line, '228-240')),
            desconto: parse_decimal(pos(entry_line, '241-253')),
            valor_pago: parse_decimal(pos(entry_line, '254-266')),
            juros_mora: parse_decimal(pos(entry_line, '267-279')),
            outros_creditos: parse_decimal(pos(entry_line, '280-292')),
            motivo_ocorrencia: parse_string(pos(entry_line, '295-295')),
            data_credito: parse_date(pos(entry_line, '296-301')),
            origem_pagamento: parse_number(pos(entry_line, '302-304')),
            cheque_bradesco: parse_number(pos(entry_line, '315-318')),
            motivo_rejeicao: parse_string(pos(entry_line, '319-328')),
            numero_cartorio: parse_number(pos(entry_line, '369-370')),
            numero_protocolo: parse_string(pos(entry_line, '371-380')),
            numero_sequencial: parse_number(pos(entry_line, '395-400'))
          }
        end
      end

      private

      def content
        @content ||= file.read.gsub(/\r\n/, "\n")
      end

      def file
        @file ||= File.open(@path)
      end

      def pos(line, position)
        i = position.split('-').map { |i| i.to_i - 1 }
        range = (i[0]..i[1])

        line[range]
      end
    end
  end
end
