require 'test_helper'

class FoodtypesControllerTest < ActionController::TestCase
  setup do
    @foodtype = foodtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foodtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foodtype" do
    assert_difference('Foodtype.count') do
      post :create, foodtype: { name: @foodtype.name }
    end

    assert_redirected_to foodtype_path(assigns(:foodtype))
  end

  test "should show foodtype" do
    get :show, id: @foodtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foodtype
    assert_response :success
  end

  test "should update foodtype" do
    patch :update, id: @foodtype, foodtype: { name: @foodtype.name }
    assert_redirected_to foodtype_path(assigns(:foodtype))
  end

  test "should destroy foodtype" do
    assert_difference('Foodtype.count', -1) do
      delete :destroy, id: @foodtype
    end

    assert_redirected_to foodtypes_path
  end
end
