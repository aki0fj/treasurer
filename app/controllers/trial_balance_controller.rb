class TrialBalanceController < ApplicationController
  def index
    @trial_balances = TrialBalance.new(params[:beg_date], params[:end_date])
  end
end
