module Kinabo
  module Utils
    def justify_string(string, length)
      I18n.transliterate(string.to_s).truncate(length, omission: '').ljust(length, ' ')
    end

    def justify_number(number, length)
      number.to_s.rjust(length, '0')
    end

    def justify_value(value, length, decimal_places = 2)
      ("%.#{decimal_places}f" % (value || 0)).gsub(/[.,]/, '').rjust(length, '0')
    end

    def fill_sequencial(lines)
      lines.map.with_index(1) { |line, index| line + justify_number(index, 6) }.join("\r\n") + "\r\n"
    end
  end
end
