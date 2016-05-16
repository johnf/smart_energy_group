require 'httparty'

module SmartEnergyGroup
  class Client
    include HTTParty
    base_uri 'api.smartenergygroups.com'
    format :plain
    # debug_output $stdout

    def initialize(site_token)
      @site_token = site_token
    end

    DATA_TYPES = {
      :power       => 'p',
      :energy      => 'e',
      :amps        => 'a',
      :channel     => 'c',
      :temperature => 'temperature',
      :voltage     => 'v',
      :state       => 'state',
      :seconds     => 'seconds',
      :heartbeat   => 'heartbeat',
      :pulse       => 'pulse',
    }.freeze

    def send_data(node_name, options)
      time = options[:when] || Time.now
      time = time.utc.strftime('%FT%T')

      data = generate_data(options)
      msg = "(site #{@site_token} (node #{node_name} #{time} #{data}))"

      response = self.class.put('/api_sites/stream', :body => msg)

      raise("Bad Post: #{response.body}") unless response.code == 200 && response.body == "(status ok)\n"
    end

    def generate_data(options)
      data = []

      DATA_TYPES.keys.each do |type|
        case options[type]
        when Array
          data += options[type].map.with_index(1) { |value, i| "(#{DATA_TYPES[type]}_#{i} #{value})" }
        when Hash
          data += options[type].map { |i, value| "(#{DATA_TYPES[type]}_#{i} #{value})" }
        when NilClass
          next
        else
          raise('Unsupported object type')
        end
      end

      data.join('')
    end
  end
end
