require 'spec_helper'
require 'support/fromtis/remessa_mock'

describe Kinabo::Fromtis::Remessa::Header do
  subject(:header) { Kinabo::Fromtis::Remessa::Header.new(header_hash) }

  let(:header_hash) { Fromtis::RemessaMock.header }

  describe '#build' do
    let(:line) { '01REMESSA01COBRANCA       07652226000116      FIDC                          094BANCO PETRA    190717        MX0000001                                                                                                                                                                                                                                                                                                                                 '}

    it 'builds the "header" part' do
      expect(header.build).to eq(line)
    end
  end
end
