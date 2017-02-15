module Cnabs
  module Bradesco
    module Remessa
      class Boleto < Hashie::Dash
        include Hashie::Extensions::Dash::Coercion

        property :transacao, coerce: Transacao, required: true
        # property :mensagem, coerce: Mensagem
        # property :pagador, coerce: Pagador

        def build
          [transacao].map(&:build)
        end
      end
    end
  end
end
