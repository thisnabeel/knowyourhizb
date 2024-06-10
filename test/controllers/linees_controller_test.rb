require 'test_helper'

class LineesControllerTest < ActionController::TestCase
  setup do
    @linee = linees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linee" do
    assert_difference('Linee.count') do
      post :create, linee: { belongs_to: @linee.belongs_to, content: @linee.content, direction: @linee.direction, font_style: @linee.font_style, position: @linee.position, recording_url: @linee.recording_url }
    end

    assert_redirected_to linee_path(assigns(:linee))
  end

  test "should show linee" do
    get :show, id: @linee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linee
    assert_response :success
  end

  test "should update linee" do
    patch :update, id: @linee, linee: { belongs_to: @linee.belongs_to, content: @linee.content, direction: @linee.direction, font_style: @linee.font_style, position: @linee.position, recording_url: @linee.recording_url }
    assert_redirected_to linee_path(assigns(:linee))
  end

  test "should destroy linee" do
    assert_difference('Linee.count', -1) do
      delete :destroy, id: @linee
    end

    assert_redirected_to linees_path
  end
end
