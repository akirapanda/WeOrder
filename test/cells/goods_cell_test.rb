require 'test_helper'

class GoodsCellTest < Cell::TestCase
  test "user_shopping" do
    invoke :user_shopping
    assert_select "p"
  end
  

end
