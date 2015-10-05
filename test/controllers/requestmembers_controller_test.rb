require 'test_helper'

class RequestmembersControllerTest < ActionController::TestCase
  setup do
    @requestmember = requestmembers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requestmembers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requestmember" do
    assert_difference('Requestmember.count') do
      post :create, requestmember: { article_id: @requestmember.article_id, member_id: @requestmember.member_id }
    end

    assert_redirected_to requestmember_path(assigns(:requestmember))
  end

  test "should show requestmember" do
    get :show, id: @requestmember
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requestmember
    assert_response :success
  end

  test "should update requestmember" do
    patch :update, id: @requestmember, requestmember: { article_id: @requestmember.article_id, member_id: @requestmember.member_id }
    assert_redirected_to requestmember_path(assigns(:requestmember))
  end

  test "should destroy requestmember" do
    assert_difference('Requestmember.count', -1) do
      delete :destroy, id: @requestmember
    end

    assert_redirected_to requestmembers_path
  end
end
