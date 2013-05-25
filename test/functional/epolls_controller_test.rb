require 'test_helper'

class EpollsControllerTest < ActionController::TestCase
  setup do
    @epoll = epolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:epolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create epoll" do
    assert_difference('Epoll.count') do
      post :create, epoll: { question: @epoll.question, status: @epoll.status, timeout: @epoll.timeout, user_id: @epoll.user_id }
    end

    assert_redirected_to epoll_path(assigns(:epoll))
  end

  test "should show epoll" do
    get :show, id: @epoll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @epoll
    assert_response :success
  end

  test "should update epoll" do
    put :update, id: @epoll, epoll: { question: @epoll.question, status: @epoll.status, timeout: @epoll.timeout, user_id: @epoll.user_id }
    assert_redirected_to epoll_path(assigns(:epoll))
  end

  test "should destroy epoll" do
    assert_difference('Epoll.count', -1) do
      delete :destroy, id: @epoll
    end

    assert_redirected_to epolls_path
  end
end
