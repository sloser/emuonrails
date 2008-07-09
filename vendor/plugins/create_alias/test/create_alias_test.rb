require 'test/unit'
require '../lib/create_alias'

class CreateAliasTest < Test::Unit::TestCase
  
  String.class_eval do
    include CreateAlias
  end
  
  def test_should_return_valid_alias_with_spaces
   assert_equal "this-is-my-permalink", "this is my permalink".create_alias
   assert_equal "another-space-test", "another   space test".create_alias
 end

 def test_should_return_valid_alias_without_spaces
   assert_equal "today", "today".create_alias
   assert_equal "bobs", "bob's".create_alias
 end

 def test_should_return_valid_alias_without_dash
   assert_equal "this-is-my-permalink", "this_is_my_permalink".create_alias
   assert_equal "another-dash-test", "another_dash___test".create_alias
 end

 def test_should_return_valid_alias_in_downcase
   assert_equal "this-is-my-permalink", "THIS is MY permalink".create_alias
 end

 def test_should_keep_dashes_and_remove_spaces
   assert_equal "dont-forget-dashes-with-spaces", "Don't forget - dashes -- with  --  spaces".create_alias
 end


 def test_should_return_valid_alias_without_croatian_letters_all_in_downcases
   assert_equal "cczsdj-cczsdj", "čćžšđ ČĆŽŠĐ".create_alias
   assert_equal "xcxcxzxsxdjx-xcxcxzxsxdjx", "xčxćxžxšxđx-xČxĆxŽxŠxĐx".create_alias
 end

 def test_should_return_valid_alias_without_any_special_chars
   assert_equal "test-test", "test'\"!?+*-test:;.&".create_alias
 end

 def test_should_return_valid_alias_with_numbers
   assert_equal "test-1234", "test 1234".create_alias
       assert_equal "1234", "1234".create_alias
 end


 ## we don't want the bang changes
 ## !ATTENTION! test this test

 def test_should_return_valid_permalink_without_bang
   string1 = "this is my permalink"
   string2 = "another   space  test"
   #assert_not_equal  "this-is-my-permalink", string1.create_alias!
   #assert_not_equal  "another-space-test", string2.create_alias!
 end
  
end
