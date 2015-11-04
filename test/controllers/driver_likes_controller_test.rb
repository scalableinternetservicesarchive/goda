require 'test_helper'

class DriverLikesControllerTest < ActionController::TestCase
  setup do
    @driver_like = driver_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driver_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver_like" do
    assert_difference('DriverLike.count') do
      post :create, driver_like: { driver_id: @driver_like.driver_id, quantity: @driver_like.quantity }
    end

    assert_redirected_to driver_like_path(assigns(:driver_like))
  end

  test "should show driver_like" do
    get :show, id: @driver_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver_like
    assert_response :success
  end

  test "should update driver_like" do
    patch :update, id: @driver_like, driver_like: { driver_id: @driver_like.driver_id, quantity: @driver_like.quantity }
    assert_redirected_to driver_like_path(assigns(:driver_like))
  end

  test "should destroy driver_like" do
    assert_difference('DriverLike.count', -1) do
      delete :destroy, id: @driver_like
    end

    assert_redirected_to driver_likes_path
  end
end
