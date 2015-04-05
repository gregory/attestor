# encoding: utf-8
require "rspec"

module Attestor

  # Helpers for validations
  module RSpec
    include ::RSpec::Mocks::ExampleMethods

    # Mocks a valid object
    def valid_spy
      object = spy
      allow(object).to receive(:validate!)
      allow(object).to receive(:validate) { Report.new(object) }

      object
    end

    # Mocks an invalid object
    def invalid_spy(messages = "invalid")
      object = spy
      error  = InvalidError.new(object, messages)
      allow(object).to receive(:validate!) { fail error }
      allow(object).to receive(:validate)  { Report.new(object, error) }

      object
    end

  end # module RSpec

end # module Attestor
