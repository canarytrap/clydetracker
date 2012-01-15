require 'test_helper'

class StoryTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_type" do
    assert_difference('StoryType.count') do
      post :create, :story_type => { }
    end

    assert_redirected_to story_type_path(assigns(:story_type))
  end

  test "should show story_type" do
    get :show, :id => story_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => story_types(:one).to_param
    assert_response :success
  end

  test "should update story_type" do
    put :update, :id => story_types(:one).to_param, :story_type => { }
    assert_redirected_to story_type_path(assigns(:story_type))
  end

  test "should destroy story_type" do
    assert_difference('StoryType.count', -1) do
      delete :destroy, :id => story_types(:one).to_param
    end

    assert_redirected_to story_types_path
  end
end
