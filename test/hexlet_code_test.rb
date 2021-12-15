# frozen_string_literal: true

require 'test_helper'
require 'minitest/autorun'

class HexletCodeText < Minitest::Test
  def setup
    user = Struct.new(:name, :job, keyword_init: true)
    @user = user.new name: 'rob'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_single_tag
    test_instance = HexletCode::Tag.build('br')
    assert_equal test_instance, '<br>'
  end

  def test_single_tag_with_option
    test_instance = HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal test_instance, '<img src="path/to/image">'
  end

  def test_single_tag_with_options
    test_instance = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal test_instance, '<input type="submit" value="Save">'
  end

  def test_paired_tag_with_block
    test_instance = HexletCode::Tag.build('label') { 'Email' }
    assert_equal test_instance, '<label>Email</label>'
  end

  def test_paired_tag_with_block_and_option
    test_instance = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal test_instance, '<label for="email">Email</label>'
  end

  def test_incorrect_single_tag_with_block
    assert_raises RuntimeError do
      HexletCode::Tag.build('hr', for: 'email') { 'Email' }
    end
  end

  def test_incorrect_empty_tag
    assert_raises RuntimeError do
      HexletCode::Tag.build('')
    end
  end

  def test_incorrect_tag_type
    assert_raises RuntimeError do
      HexletCode::Tag.build({})
    end
  end

  def test_form_for
    test_instance = HexletCode.form_for @user
    assert_equal test_instance, %(<form action="#" method="post">\n</form>)
  end

  def test_form_for_with_url
    test_instance = HexletCode.form_for @user, url: '/users'
    assert_equal test_instance, %(<form action="/users" method="post">\n</form>)
  end
end
