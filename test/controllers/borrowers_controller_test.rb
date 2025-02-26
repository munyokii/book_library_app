require "test_helper"

class BorrowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrowers_index_url
    assert_response :success
  end

  test "should get show" do
    get borrowers_show_url
    assert_response :success
  end
end
