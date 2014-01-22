require 'test_helper'

class PageboxesControllerTest < ActionController::TestCase
  setup do
    @pagebox = pageboxes(:one)
    @page = pages(:one)
  end

  test "should get index" do
    get :index, :page_id => @page.to_param
    assert_response :success
    assert_not_nil assigns(:pageboxes)
  end

  test "should get new" do
    get :new, :page_id => @page.to_param, :id => @page
    assert_response :success
  end

  test "should create pagebox" do
    assert_difference('Pagebox.count') do
      post :create, {:page_id => @page.to_param, :pagebox => {:title => "test", :content => "http://www.asdf.com"}}
    end

    assert_redirected_to assigns(:pagebox).page
  end

  test "should show pagebox" do
    get :show, :page_id => @page, :id => @pagebox
    assert_response :success
  end

  test "should get edit" do
    get :edit, :page_id => @page.to_param, :id => @pagebox.to_param
    assert_response :success
  end

  test "should update pagebox" do
    put :update, :page_id => @page, :id => @pagebox, :pagebox => @pagebox.attributes
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy pagebox" do
    assert_difference('Pagebox.count', -1) do
      delete :destroy, {:page_id => @page.to_param, :id => @pagebox.to_param}
    end

    assert_redirected_to @page
  end
end
