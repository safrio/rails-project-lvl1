# frozen_string_literal: true

require 'test_helper'
require 'minitest/autorun'

class HexletCodeText < Minitest::Test
  include HexletCode

  def setup
    user = Struct.new(:name, :job, :gender, keyword_init: true)
    @user = user.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil VERSION
  end

  def test_single_tag
    test_instance = Tag.build('br')
    assert_equal test_instance, '<br />'
  end

  def test_single_tag_with_options
    test_instance = Tag.build('input', type: 'submit', value: 'Save')
    assert_equal test_instance, '<input type="submit" value="Save" />'
  end

  def test_paired_tag_with_block
    test_instance = Tag.build('label') { 'Email' }
    assert_equal test_instance, '<label>Email</label>'
  end

  def test_paired_tag_with_block_and_option
    test_instance = Tag.build('label', for: 'email') { 'Email' }
    assert_equal test_instance, '<label for="email">Email</label>'
  end

  def test_error_empty_tag
    assert_raises HexletCodeError do
      Tag.build('')
    end
  end

  def test_error_tag_type
    assert_raises HexletCodeError do
      Tag.build({})
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

  def test_form_for_with_block
    test_instance = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal test_instance, %(<form action="#" method="post">
<label for="name">Name</label>
<input name="name" type="text" value="rob" />
<label for="job">Job</label>
<textarea cols="20" name="job" rows="40">hexlet</textarea>
<input name="submit" type="submit" value="Save" />
</form>)
  end

  def test_error_form_for_with_url_and_block
    assert_raises NameError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
        f.submit
      end
    end
  end
end
