require 'test_helper'

class BrendsControllerTest < ActionController::TestCase
  setup do
    @brend = brends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brend" do
    assert_difference('Brend.count') do
      post :create, brend: { category_id: @brend.category_id, discription: @brend.discription, title: @brend.title }
    end

    assert_redirected_to brend_path(assigns(:brend))
  end

  test "should show brend" do
    get :show, id: @brend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brend
    assert_response :success
  end

  test "should update brend" do
    patch :update, id: @brend, brend: { category_id: @brend.category_id, discription: @brend.discription, title: @brend.title }
    assert_redirected_to brend_path(assigns(:brend))
  end

  test "should destroy brend" do
    assert_difference('Brend.count', -1) do
      delete :destroy, id: @brend
    end

    assert_redirected_to brends_path
  end
end
