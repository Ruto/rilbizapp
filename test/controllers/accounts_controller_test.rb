require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url, as: :json
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { accountable_id: @account.accountable_id, accountable_type: @account.accountable_type, active: @account.active, contacts: @account.contacts, memo: @account.memo, name: @account.name, type: @account.type, user_id: @account.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show account" do
    get account_url(@account), as: :json
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { accountable_id: @account.accountable_id, accountable_type: @account.accountable_type, active: @account.active, contacts: @account.contacts, memo: @account.memo, name: @account.name, type: @account.type, user_id: @account.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account), as: :json
    end

    assert_response 204
  end
end
