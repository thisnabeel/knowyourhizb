require 'test_helper'

class FiqhPrinciplesControllerTest < ActionController::TestCase
  setup do
    @fiqh_principle = fiqh_principles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fiqh_principles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fiqh_principle" do
    assert_difference('FiqhPrinciple.count') do
      post :create, fiqh_principle: { description: @fiqh_principle.description, title: @fiqh_principle.title }
    end

    assert_redirected_to fiqh_principle_path(assigns(:fiqh_principle))
  end

  test "should show fiqh_principle" do
    get :show, id: @fiqh_principle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fiqh_principle
    assert_response :success
  end

  test "should update fiqh_principle" do
    patch :update, id: @fiqh_principle, fiqh_principle: { description: @fiqh_principle.description, title: @fiqh_principle.title }
    assert_redirected_to fiqh_principle_path(assigns(:fiqh_principle))
  end

  test "should destroy fiqh_principle" do
    assert_difference('FiqhPrinciple.count', -1) do
      delete :destroy, id: @fiqh_principle
    end

    assert_redirected_to fiqh_principles_path
  end
end
