module Kinabo
  module Fromtis
    module Remessa
      class Builder < Hashie::Dash
        include Hashie::Extensions::Dash::Coercion
        include Kinabo::Utils

        property :header, coerce: Header, required: true
        property :transacoes, coerce: Array[Transacao], required: true

        def build
          lines = [header, transacoes, Trailler.new].flatten.map(&:build)

          fill_sequencial(lines.flatten)
        end
      end
    end
  end
end
