# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/error'
require_relative 'hexlet_code/form'

module HexletCode
  class << self
    def form_for(data, url: '#', method: 'post', &block)
      raise HexletCodeError, 'Block is empty' if block.nil?

      form = Form.new(form_attrs: { method: method, action: url }, data: data)
      block&.call(form)

      form.render
    end
  end
end
