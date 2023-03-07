require "test_helper"

class ClipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clips_index_url
    assert_response :success
  end
end
