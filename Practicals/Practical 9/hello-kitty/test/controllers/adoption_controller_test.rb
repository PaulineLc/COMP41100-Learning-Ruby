require 'test_helper'

class AdoptionControllerTest < ActionDispatch::IntegrationTest
  test "should get kittenlisting" do
    get adoption_kittenlisting_url
    assert_response :success
  end

end
