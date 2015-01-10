require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get activate" do
    get :activate
    assert_response :success
  end

  test "should get deactivate" do
    get :deactivate
    assert_response :success
  end

end
