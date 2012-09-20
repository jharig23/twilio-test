require 'test_helper'

class TxtTestsControllerTest < ActionController::TestCase
  setup do
    @txt_test = txt_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:txt_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create txt_test" do
    assert_difference('TxtTest.count') do
      post :create, txt_test: {  }
    end

    assert_redirected_to txt_test_path(assigns(:txt_test))
  end

  test "should show txt_test" do
    get :show, id: @txt_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @txt_test
    assert_response :success
  end

  test "should update txt_test" do
    put :update, id: @txt_test, txt_test: {  }
    assert_redirected_to txt_test_path(assigns(:txt_test))
  end

  test "should destroy txt_test" do
    assert_difference('TxtTest.count', -1) do
      delete :destroy, id: @txt_test
    end

    assert_redirected_to txt_tests_path
  end
end
