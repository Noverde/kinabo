require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Cnabs::Bradesco::Remessa::Boleto do
  subject(:boleto) { Cnabs::Bradesco::Remessa::Boleto.new(boleto_hash) }

  let(:boleto_hash) { { transacao: { agencia_debito: '8888' } } }

  describe '#build' do
    it 'builds the header part' do

      require 'pry'; binding.pry
      # expect(header.build).to eq('1')
    end
  end
end
