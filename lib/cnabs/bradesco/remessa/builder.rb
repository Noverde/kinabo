module Cnabs
  module Bradesco
    module Remessa
      class Builder < Hashie::Dash
        include Hashie::Extensions::Dash::Coercion
        include Cnabs::Utils

        property :header, coerce: Header, required: true
        property :boletos, coerce: Array[Boleto], required: true

        def build
          lines = [header, boletos, Trailler.new].flatten.map(&:build).join("\r\n")

          fill_sequencials(lines)
        end
      end
    end
  end
end
