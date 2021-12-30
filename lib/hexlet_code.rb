# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :HexletCodeError, 'hexlet_code/error'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'

  class << self
    def form_for(data, url: '#', method: 'post', &block)
      raise HexletCodeError, 'Block is empty' if block.nil?

      form = Form.new(form_attrs: { method: method, action: url }, data: data)
      block&.call(form)

      form.render
    end
  end
end
