require 'test_helper'

class PageboxesControllerTest < ActionController::TestCase
  setup do
    @pagebox = pageboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pageboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagebox" do
    assert_difference('Pagebox.count') do
      post :create, :pagebox => @pagebox.attributes
    end

    assert_redirected_to pagebox_path(assigns(:pagebox))
  end

  test "should show pagebox" do
    get :show, :id => @pagebox
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pagebox
    assert_response :success
  end

  test "should update pagebox" do
    put :update, :id => @pagebox, :pagebox => @pagebox.attributes
    assert_redirected_to pagebox_path(assigns(:pagebox))
  end

  test "should destroy pagebox" do
    assert_difference('Pagebox.count', -1) do
      delete :destroy, :id => @pagebox
    end

    assert_redirected_to pageboxes_path
  end
end
