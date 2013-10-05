require 'test_helper'

class GoodsCellTest < Cell::TestCase
  test "lastest" do
    invoke :lastest
    assert_select "p"
  end
  

end
