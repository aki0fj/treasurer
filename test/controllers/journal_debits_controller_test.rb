require 'test_helper'

class JournalDebitsControllerTest < ActionController::TestCase
  setup do
    @journal_debit = journal_debits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_debits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_debit" do
    assert_difference('JournalDebit.count') do
      post :create, journal_debit: {  }
    end

    assert_redirected_to journal_debit_path(assigns(:journal_debit))
  end

  test "should show journal_debit" do
    get :show, id: @journal_debit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_debit
    assert_response :success
  end

  test "should update journal_debit" do
    patch :update, id: @journal_debit, journal_debit: {  }
    assert_redirected_to journal_debit_path(assigns(:journal_debit))
  end

  test "should destroy journal_debit" do
    assert_difference('JournalDebit.count', -1) do
      delete :destroy, id: @journal_debit
    end

    assert_redirected_to journal_debits_path
  end
end
