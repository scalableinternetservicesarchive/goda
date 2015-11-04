require 'test_helper'

class HitcherLikesControllerTest < ActionController::TestCase
  setup do
    @hitcher_like = hitcher_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hitcher_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hitcher_like" do
    assert_difference('HitcherLike.count') do
      post :create, hitcher_like: { hitcher_id: @hitcher_like.hitcher_id, quantity: @hitcher_like.quantity, user_id: @hitcher_like.user_id }
    end

    assert_redirected_to hitcher_like_path(assigns(:hitcher_like))
  end

  test "should show hitcher_like" do
    get :show, id: @hitcher_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hitcher_like
    assert_response :success
  end

  test "should update hitcher_like" do
    patch :update, id: @hitcher_like, hitcher_like: { hitcher_id: @hitcher_like.hitcher_id, quantity: @hitcher_like.quantity, user_id: @hitcher_like.user_id }
    assert_redirected_to hitcher_like_path(assigns(:hitcher_like))
  end

  test "should destroy hitcher_like" do
    assert_difference('HitcherLike.count', -1) do
      delete :destroy, id: @hitcher_like
    end

    assert_redirected_to hitcher_likes_path
  end
end
