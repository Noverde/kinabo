require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Cnabs::Bradesco::Remessa::Header do
  subject(:header) { Cnabs::Bradesco::Remessa::Header.new(header_hash) }

  let(:header_hash) { Bradesco::RemessaMock.header }

  describe '#build' do
    let(:line) { '01REMESSA01COBRANCA       00000000000004359923FIDC TESTE                    237BRADESCO       070217        MX0007896                                                                                                                                                                                                                                                                                     ' }

    it 'builds the header part' do
      expect(header.build).to eq(line)
    end
  end
end
