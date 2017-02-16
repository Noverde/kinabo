module Kinabo
  module Bradesco
    module Remessa
      class Builder < Hashie::Dash
        include Hashie::Extensions::Dash::Coercion
        include Kinabo::Utils

        property :header, coerce: Header, required: true
        property :boletos, coerce: Array[Boleto], required: true

        def build
          lines = [header, boletos, Trailler.new].flatten.map(&:build)

          fill_sequencial(lines.flatten)
        end
      end
    end
  end
end
