require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Cnabs::Bradesco::Remessa::Builder do
  subject(:builder) { Cnabs::Bradesco::Remessa::Builder.new(builder_hash) }

  let(:header_hash) { Bradesco::RemessaMock.header }
  let(:boletos_hash) { Bradesco::RemessaMock.boletos }
  let(:builder_hash) { { header: header_hash, boletos: boletos_hash } }

  describe '#build' do
    it 'builds all the parts' do

      builder.build

      require 'pry'; binding.pry
    end
  end
end

