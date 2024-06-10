require 'test_helper'

class LineTranslationsControllerTest < ActionController::TestCase
  setup do
    @line_translation = line_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_translation" do
    assert_difference('LineTranslation.count') do
      post :create, line_translation: { content: @line_translation.content, content_explanation: @line_translation.content_explanation, grammar_explanation: @line_translation.grammar_explanation, language: @line_translation.language, line_id: @line_translation.line_id }
    end

    assert_redirected_to line_translation_path(assigns(:line_translation))
  end

  test "should show line_translation" do
    get :show, id: @line_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_translation
    assert_response :success
  end

  test "should update line_translation" do
    patch :update, id: @line_translation, line_translation: { content: @line_translation.content, content_explanation: @line_translation.content_explanation, grammar_explanation: @line_translation.grammar_explanation, language: @line_translation.language, line_id: @line_translation.line_id }
    assert_redirected_to line_translation_path(assigns(:line_translation))
  end

  test "should destroy line_translation" do
    assert_difference('LineTranslation.count', -1) do
      delete :destroy, id: @line_translation
    end

    assert_redirected_to line_translations_path
  end
end
