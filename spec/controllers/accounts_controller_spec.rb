require 'spec_helper'

describe AccountsController do
  let(:valid_attributes) {
    {
    :acc_cd => "code",
    :acc_name_en => "en",
    :acc_name_ja => "ja",
    :account_type_id => 1
    }
  }

  let(:valid_session) { {} }

  specify "assigns all accounts as @accounts" do
    acc = Account.create! valid_attributes
    get :index, {}, valid_session
    expect(assigns(:accounts)).to eq([acc])
  end

  specify "assigns requested account as @account" do
    acc = Account.create! valid_attributes
    get :show, {:id => acc.to_param}, valid_session
    expect(assigns(:account)).to eq(acc)
  end

  specify "assigns new account as @account" do
    get :new, {}, valid_session
    expect(assigns(:account)).to be_a_new(Account)
  end

  specify "assigns requested account as @account" do
    acc = Account.create! valid_attributes
    get :edit, {:id => acc.to_param}, valid_session
    expect(assigns(:account)).to eq(acc)
  end

  describe "POST create" do
    describe "with valid params" do
      specify "creates a new Account" do
        expect {
          post :create, {:account => valid_attributes}, valid_session
        }.to change(Account, :count).by(1)
      end

      specify "assigns a created account as @account" do
        post :create, {:account => valid_attributes}, valid_session
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted 
      end

      specify "redirects to created account" do
        post :create, {:account => valid_attributes}, valid_session
        expect(response).to redirect_to(Account.last)
      end
    end
    describe "with invalid params" do
      specify "assigns created but ubsaved account as @account" do
        post :create, {:account => {:acc_cd => nil}}, valid_session
        expect(assigns(:account)).to be_a_new(Account)
      end

      specify "re-render 'new' template" do
        post :create, {:account => {:acc_cd => nil}}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
