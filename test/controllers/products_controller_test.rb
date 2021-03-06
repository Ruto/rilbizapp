require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { active: @product.active, convenient: @product.convenient, desc: @product.desc, durability: @product.durability, durable: @product.durable, industrial: @product.industrial, internal_trade: @product.internal_trade, name: @product.name, resaleable: @product.resaleable, type: @product.type, user_id: @product.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { active: @product.active, convenient: @product.convenient, desc: @product.desc, durability: @product.durability, durable: @product.durable, industrial: @product.industrial, internal_trade: @product.internal_trade, name: @product.name, resaleable: @product.resaleable, type: @product.type, user_id: @product.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response 204
  end
end
