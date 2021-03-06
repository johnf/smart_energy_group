require 'spec_helper'

require 'webmock/rspec'
require 'timecop'

require 'smart_energy_group/client'

describe SmartEnergyGroup::Client do
  describe 'API' do
    let(:site_token) { '1234' }
    let(:client) { described_class.new(site_token) }
    let(:url) { 'http://api.smartenergygroups.com/api_sites/stream' }
    let(:response) { "(status ok)\n" }

    before do
      Timecop.freeze(Time.utc(2015))
    end

    after do
      Timecop.return
    end

    it 'sends data' do
      body = '(site 1234 (node home 2015-01-01T00:00:00 (p_1 100)(p_2 80)(p_3 90)(temperature_1 33)(temperature_2 40)))'
      st = stub_request(:put, url).with(:body => body).to_return(:body => response)

      client.send_data(
        'home',
        :temperature => [33, 40],
        :power       => [100, 80, 90]
      )

      expect(st).to have_been_requested
    end

    it 'sends gappy data' do
      body = '(site 1234 (node home 2015-01-01T00:00:00 (p_1 100)(p_4 80)(p_5 90)))'
      st = stub_request(:put, url).with(:body => body).to_return(:body => response)

      client.send_data(
        'home',
        :power => { 1 => 100, 4 => 80, 5 => 90 }
      )

      expect(st).to have_been_requested
    end
  end
end
