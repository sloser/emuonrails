require 'test/unit'
require '../lib/create_alias'

class CreateAliasTest < Test::Unit::TestCase
  
  String.class_eval do
    include CreateAlias
  end
  
  def test_should_return_valid_alias_with_spaces
    assert_equal "this-is-my-permalink", "this is my permalink".create_alias
    assert_equal "another-space-test", "another   space  test".create_alias
  end
  
  def test_should_return_valid_alias_without_spaces
    assert_equal "today", "today".create_alias
    assert_equal "bobs", "bob's".create_alias
  end
  
end
