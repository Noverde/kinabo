require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Cnabs::Bradesco::Remessa::Transacao do
  subject(:transacao) { Cnabs::Bradesco::Remessa::Transacao.new(transacao_hash) }

  let(:transacao_hash) { Bradesco::RemessaMock.transacao }

  describe '#build' do
    let(:line) { '10000000000000000000000900289014779221113978      01 01 00001 0000000020000348757100000000001N           2  0123273 - 1 10031700000005309490000000001N070217000000000000015930000000000000000000000000000000000000000000000209472744000172SACADO                                  R TESTE         808  S 03                           58010180002696282000120  SACADOR AVALISTA                           000002' }
    let(:sequencial) { '000002' }

    it 'builds the "transacao" part' do
      expect(transacao.build % sequencial).to eq(line)
    end
  end
end
