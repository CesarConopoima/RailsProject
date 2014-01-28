require 'test_helper'

class VistaControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get empresa" do
    get :empresa
    assert_response :success
  end

  test "should get servicio" do
    get :servicio
    assert_response :success
  end

  test "should get producto" do
    get :producto
    assert_response :success
  end

  test "should get contactar" do
    get :contactar
    assert_response :success
  end

end
