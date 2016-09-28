require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Hello, Rails!"
  end

  test "successfully create an article" do
    @credential = ActionController::HttpAuthentication::Basic.encode_credentials("dhh", "secret")
    get "/articles/new",
        headers: {'HTTP_AUTHORIZATION': @credential}
    assert_response :success

    post "/articles",
         params: { article: { title: "can create",
                              body: "article succeessfully"} },
         headers: {'HTTP_AUTHORIZATION': @credential}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\n  can create"
  end
end
