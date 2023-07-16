require 'test_helper'

class ConclusionsControllerTest < ActionController::TestCase
  setup do
    @conclusion = conclusions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conclusions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conclusion" do
    assert_difference('Conclusion.count') do
      post :create, conclusion: { body: @conclusion.body, narration_id: @conclusion.narration_id, position: @conclusion.position, signal: @conclusion.signal }
    end

    assert_redirected_to conclusion_path(assigns(:conclusion))
  end

  test "should show conclusion" do
    get :show, id: @conclusion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conclusion
    assert_response :success
  end

  test "should update conclusion" do
    patch :update, id: @conclusion, conclusion: { body: @conclusion.body, narration_id: @conclusion.narration_id, position: @conclusion.position, signal: @conclusion.signal }
    assert_redirected_to conclusion_path(assigns(:conclusion))
  end

  test "should destroy conclusion" do
    assert_difference('Conclusion.count', -1) do
      delete :destroy, id: @conclusion
    end

    assert_redirected_to conclusions_path
  end
end
