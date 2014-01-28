require 'test_helper'

class SesionControllerTest < ActionController::TestCase
  test "should get nueva" do
    get :nueva
    assert_response :success
  end

  test "should login" do
  dave = usuarios(:one)
  post :crear, nombre: dave.name, password: 'secret'
  assert_redirected_to admin_url
  assert_equal dave.id, sesion[:user_id]
  end

  test "should fail login" do
  dave = usuarios(:one)
  post :crear, nombre: dave.nombre, password: 'wrong'
  assert_redirected_to login_url
  end

  test "should logout" do
  delete :borrar
  assert_redirected_to layout_url
  end

  test "should get crear" do
    get :crear
    assert_response :success
  end

  test "should get borrar" do
    get :borrar
    assert_response :success
  end

end
