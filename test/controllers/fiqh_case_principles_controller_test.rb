require 'test_helper'

class FiqhCasePrinciplesControllerTest < ActionController::TestCase
  setup do
    @fiqh_case_principle = fiqh_case_principles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fiqh_case_principles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fiqh_case_principle" do
    assert_difference('FiqhCasePrinciple.count') do
      post :create, fiqh_case_principle: { fiqh_case_id: @fiqh_case_principle.fiqh_case_id, fiqh_principle_id: @fiqh_case_principle.fiqh_principle_id, passing: @fiqh_case_principle.passing }
    end

    assert_redirected_to fiqh_case_principle_path(assigns(:fiqh_case_principle))
  end

  test "should show fiqh_case_principle" do
    get :show, id: @fiqh_case_principle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fiqh_case_principle
    assert_response :success
  end

  test "should update fiqh_case_principle" do
    patch :update, id: @fiqh_case_principle, fiqh_case_principle: { fiqh_case_id: @fiqh_case_principle.fiqh_case_id, fiqh_principle_id: @fiqh_case_principle.fiqh_principle_id, passing: @fiqh_case_principle.passing }
    assert_redirected_to fiqh_case_principle_path(assigns(:fiqh_case_principle))
  end

  test "should destroy fiqh_case_principle" do
    assert_difference('FiqhCasePrinciple.count', -1) do
      delete :destroy, id: @fiqh_case_principle
    end

    assert_redirected_to fiqh_case_principles_path
  end
end
