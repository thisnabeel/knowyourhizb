require 'test_helper'

class LineeTranslationsControllerTest < ActionController::TestCase
  setup do
    @linee_translation = linee_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linee_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linee_translation" do
    assert_difference('LineeTranslation.count') do
      post :create, linee_translation: { belongs_to: @linee_translation.belongs_to, content: @linee_translation.content, content_explanation: @linee_translation.content_explanation, grammar_explanation: @linee_translation.grammar_explanation, language: @linee_translation.language }
    end

    assert_redirected_to linee_translation_path(assigns(:linee_translation))
  end

  test "should show linee_translation" do
    get :show, id: @linee_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linee_translation
    assert_response :success
  end

  test "should update linee_translation" do
    patch :update, id: @linee_translation, linee_translation: { belongs_to: @linee_translation.belongs_to, content: @linee_translation.content, content_explanation: @linee_translation.content_explanation, grammar_explanation: @linee_translation.grammar_explanation, language: @linee_translation.language }
    assert_redirected_to linee_translation_path(assigns(:linee_translation))
  end

  test "should destroy linee_translation" do
    assert_difference('LineeTranslation.count', -1) do
      delete :destroy, id: @linee_translation
    end

    assert_redirected_to linee_translations_path
  end
end
