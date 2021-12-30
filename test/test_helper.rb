# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def fixture(filename)
  File.read("./test/fixtures/#{filename}.html")
end
