require 'test_helper'

class FiqhCasesControllerTest < ActionController::TestCase
  setup do
    @fiqh_case = fiqh_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fiqh_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fiqh_case" do
    assert_difference('FiqhCase.count') do
      post :create, fiqh_case: { description: @fiqh_case.description, fiqh_case_id: @fiqh_case.fiqh_case_id, position: @fiqh_case.position, title: @fiqh_case.title }
    end

    assert_redirected_to fiqh_case_path(assigns(:fiqh_case))
  end

  test "should show fiqh_case" do
    get :show, id: @fiqh_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fiqh_case
    assert_response :success
  end

  test "should update fiqh_case" do
    patch :update, id: @fiqh_case, fiqh_case: { description: @fiqh_case.description, fiqh_case_id: @fiqh_case.fiqh_case_id, position: @fiqh_case.position, title: @fiqh_case.title }
    assert_redirected_to fiqh_case_path(assigns(:fiqh_case))
  end

  test "should destroy fiqh_case" do
    assert_difference('FiqhCase.count', -1) do
      delete :destroy, id: @fiqh_case
    end

    assert_redirected_to fiqh_cases_path
  end
end
