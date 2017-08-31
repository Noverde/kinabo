require 'spec_helper'
require 'support/fromtis/remessa_mock'

describe Kinabo::Fromtis::Remessa::Transacao do
  subject(:transacao) { Kinabo::Fromtis::Remessa::Transacao.new(transacao_hash) }

  let(:transacao_hash) { Fromtis::RemessaMock.transacao }

  describe '#build' do
    let(:line) { '1                   02000000110000  0000000023660999007       0000000000000000000000000348751 190717        77002366099905071700000000334262370000001 010116000020000000000000000000000000000000000000003342600000000000000100030691232288Rogerio Oliveira Santo                                                          00000000000000000000RUBYBANK                                      59156195000106                                            ' }

    it 'builds the "transacao" part' do
      expect(transacao.build).to eq(line)
    end
  end
end
