require 'test_helper'

class FileControllerTest < ActionController::TestCase
  test "should get upload" do
    put :upload, :file => fixture_file_upload("file_upload_data","text/plane")
    assert_response :success
  end

end
