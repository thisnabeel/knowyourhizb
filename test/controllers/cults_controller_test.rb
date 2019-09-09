require 'test_helper'

class CultsControllerTest < ActionController::TestCase
  setup do
    @cult = cults(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cults)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cult" do
    assert_difference('Cult.count') do
      post :create, cult: { cult_id: @cult.cult_id, leading_figure: @cult.leading_figure, release_date: @cult.release_date, technical_terms: @cult.technical_terms, title: @cult.title }
    end

    assert_redirected_to cult_path(assigns(:cult))
  end

  test "should show cult" do
    get :show, id: @cult
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cult
    assert_response :success
  end

  test "should update cult" do
    patch :update, id: @cult, cult: { cult_id: @cult.cult_id, leading_figure: @cult.leading_figure, release_date: @cult.release_date, technical_terms: @cult.technical_terms, title: @cult.title }
    assert_redirected_to cult_path(assigns(:cult))
  end

  test "should destroy cult" do
    assert_difference('Cult.count', -1) do
      delete :destroy, id: @cult
    end

    assert_redirected_to cults_path
  end
end
