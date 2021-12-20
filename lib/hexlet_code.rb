# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/error'
require_relative 'hexlet_code/form'
require 'haml'
require 'haml/template/options'

module HexletCode
  def initialize(*args)
    Haml::Options.defaults[:attr_wrapper] = '"'
    Haml::Options.defaults[:format] = :xhtml
    super
  end

  class << self
    def form_for(data, url: '#', method: 'post', &block)
      form = Form.new(form_attrs: { method: method, action: url }, data: data)
      block&.call(form)

      form.render
    end
  end
end
