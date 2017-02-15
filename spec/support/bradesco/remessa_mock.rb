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
          transacao: transacao
        }
      end

      def transacao
        {
          agencia_debito: 1234
        }
      end
    end
  end
end
