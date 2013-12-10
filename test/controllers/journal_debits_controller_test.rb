require 'test_helper'

class JournalDebitsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
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
      post :create, 
        journal_debit: {
          occur_on: @journal_debit.occur_on,
          account_id: @journal_debit.account.id,
          amount: @journal_debit.amount,
          description: @journal_debit.description,
          p_r: @journal_debit.p_r
        } ,
        journal_credit: {
          account_id: @journal_debit.journal_credit.account.id
        }
    end

    assert_redirected_to journal_debit_path(assigns(:journal_debit))
  end

  test "should show journal_debit" do
    get :show, id: @journal_debit
    assert_response :success
  end

  test "should get edit" do
    @journal_debit.account = @acounts
    get :edit, id: @journal_debit.id
    assert_response :success
  end

  test "should update journal_debit" do
    patch :update, id: @journal_debit, 
      journal_debit: {
        occur_on: @journal_debit.occur_on,
        account: @journal_debit.account,
        amount: @journal_debit.amount,
        description: @journal_debit.description,
        p_r: @journal_debit.p_r
      } ,
      journal_credit: {
        account: @journal_debit.journal_credit.account
      }
    assert_redirected_to journal_debit_path(assigns(:journal_debit))
  end

  test "should destroy journal_debit" do
    assert_difference('JournalDebit.count', -1) do
      delete :destroy, id: @journal_debit
    end

    assert_redirected_to journal_debits_path
  end
end
