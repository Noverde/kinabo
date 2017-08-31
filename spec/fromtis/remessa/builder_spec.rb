require 'spec_helper'
require 'support/fromtis/remessa_mock'

describe Kinabo::Fromtis::Remessa::Builder do
  subject(:builder) { Kinabo::Fromtis::Remessa::Builder.new(builder_hash) }

  let(:header_hash) { Fromtis::RemessaMock.header }
  let(:transacoes_hash) { Fromtis::RemessaMock.transacoes }
  let(:builder_hash) { { header: header_hash, transacoes: transacoes_hash } }

  let(:fixture) { File.open('spec/fixtures/remessa/fromtis.rem').read.gsub(/\n/, "\r\n") }

  describe '#build' do
    it 'builds all the parts' do
      expect(builder.build).to eq(fixture)
    end
  end
end
