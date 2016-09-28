require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @article = articles(:one)
    @credential = ActionController::HttpAuthentication::Basic.encode_credentials("dhh", "secret")
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterward
    Rails.cache.clear
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url,
        headers: {'HTTP_AUTHORIZATION': @credential}
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url,
           params: { article: { body: 'Rails is awesome!',
                                title:'Hello Rails!' }},
           headers:{'HTTP_AUTHORIZATION' => @credential}
    end

    assert_redirected_to article_url(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article),
        headers:{'HTTP_AUTHORIZATION': @credential}
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article),
          params: { article: { title: 'updated' } },
          headers: {'HTTP_AUTHORIZATION': @credential}
    assert_redirected_to article_url(@article)
    @article.reload
    assert_equal "updated", @article.title
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article),
             headers:{'HTTP_AUTHORIZATION': @credential}
    end

    assert_redirected_to articles_url
  end
end
