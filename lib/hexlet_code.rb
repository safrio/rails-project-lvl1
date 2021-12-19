# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/error'
require_relative 'hexlet_code/config'
require 'haml'
require 'haml/template/options'

module HexletCode
  def initialize(*args)
    Haml::Options.defaults[:attr_wrapper] = '"'
    Haml::Options.defaults[:format] = :xhtml
    super
  end

  class << self
    attr_accessor :inputs, :attrs, :obj

    def form_for(obj, url: '#', method: 'post', &block)
      raise HexletCodeError, 'Object has not Struct parent' unless obj.class.ancestors.include? Struct

      @inputs = []
      @obj = obj
      @attrs = { method: method, action: url }

      block&.call(self)

      Haml::Engine.new(form_template).render(form)
    end

    def input(name, *opts) = inputs << { name: name, value: obj[name], opts: opts }

    private

    def form
      Struct.new(:inputs, :attrs, keyword_init: true)
            .new(inputs: inputs, attrs: @attrs)
    end

    def form_template = File.read("#{Config::TEMPLATES}/form.html.haml")
  end
end
