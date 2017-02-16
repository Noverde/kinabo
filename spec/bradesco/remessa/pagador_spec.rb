require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Kinabo::Bradesco::Remessa::Pagador do
  subject(:pagador) { Kinabo::Bradesco::Remessa::Pagador.new(pagador_hash) }

  let(:pagador_hash) { Bradesco::RemessaMock.pagador }

  describe '#build' do
    let(:line) { '7ENDERECO SACADOR     - AREIAS                50781000RECIFE              PE                                                                                                                                                                                                                                                                                                  0090028901477922200003487571' }

    it 'builds the "pagador" part' do
      expect(pagador.build).to eq(line)
    end
  end
end
