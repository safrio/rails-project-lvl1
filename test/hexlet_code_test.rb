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

  def test_error_empty_form
    assert_raises HexletCodeError do
      HexletCode.form_for @user
    end
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
