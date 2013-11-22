class JournalDebitsController < ApplicationController
  before_action :set_journal_debit, only: [:show, :edit, :update, :destroy]

  # GET /journal_debits
  # GET /journal_debits.json
  def index
    @journal_debits = JournalDebit.all
  end

  # GET /journal_debits/1
  # GET /journal_debits/1.json
  def show
  end

  # GET /journal_debits/new
  def new
    @journal_debit = JournalDebit.new
    @journal_debit.account = Account.new
    @journal_debit.journal_credit = JournalCredit.new
    @journal_debit.journal_credit.account = Account.new
  end

  # GET /journal_debits/1/edit
  def edit
  end

  # POST /journal_debits
  # POST /journal_debits.json
  def create
    @journal_debit = JournalDebit.new(journal_debit_params)
    @journal_debit.journal_credit =
      JournalCredit.new(journal_credit_params)

    respond_to do |format|
      if @journal_debit.save
        format.html { redirect_to @journal_debit, notice: 'Journal debit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @journal_debit }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal_debit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_debits/1
  # PATCH/PUT /journal_debits/1.json
  def update
    respond_to do |format|
      if @journal_debit.update(journal_debit_params) &&
        @journal_debit.journal_credit.update(journal_credit_params)
        format.html { redirect_to @journal_debit, notice: 'Journal debit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @journal_debit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_debits/1
  # DELETE /journal_debits/1.json
  def destroy
    @journal_debit.destroy
    respond_to do |format|
      format.html { redirect_to journal_debits_url }
      format.json { head :no_content }
    end
  end

  # search
  def search_account
    @flg = params[:res_id]    # return deb or cre
    accounts = Account.where("acc_cd = ?", params[:acc_cd])
    accounts[0] = Account.new if accounts[0] == nil
    @acc_id = accounts[0].id.to_s   # account_id for save to journal
    if I18n.locale == 'en'
      @acc_name = accounts[0].acc_name_en # account_name for view
    else
      @acc_name = accounts[0].acc_name_ja
    end
    render :search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_debit
      @journal_debit = JournalDebit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_debit_params
     params.require(:journal_debit).permit(
       :occur_on, :account_id, :amount, :description, :p_r)
    end
    def journal_credit_params
      params.require(:journal_credit).permit(:account_id)
    end
end
