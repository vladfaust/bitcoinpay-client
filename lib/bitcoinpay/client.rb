require "httparty"

module Bitcoinpay
  class Client
    include HTTParty
    base_uri 'https://www.bitcoinpay.com/api/v1'

    def initialize(api_key)
      @api_key = api_key
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Token #{ @api_key }"
      }
    end

    def create_new_payment_request(values = {})
      params = { body: values.to_json, headers: headers }
      self.class.post('/payment/btc', params).parsed_response
    end

    def get_payment(payment_id: nil)
      self.class.get("/payment/btc/#{ payment_id }", { headers: headers }).parsed_response
    end

    def get_rates
      self.class.get('/rates/btc').parsed_response
    end

    # Returns explicit rate for given currency
    #
    # @example
    #   Bitcoinpay::Client.new('api_key').get_rate('USD')
    #   => 663.17
    #
    def get_rate(currency = 'USD')
      get_rates.reduce({}){ |h, v| h.merge v }[currency].to_f
    end

    def get_transaction_history(options = {})
      raise NotImplemented
    end

    def get_transaction_detail(options = {})
      raise NotImplemented
    end

    def get_settlement_history(options = {})
      raise NotImplemented
    end

    def get_settlement(options = {})
      raise NotImplemented
    end
  end
end
