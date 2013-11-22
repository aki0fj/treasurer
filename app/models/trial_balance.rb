class TrialBalance 
  attr_reader :records
  def initialize(beg_date, end_date)
    @records = []
    return @records if beg_date.nil?
    ac = Account.all(:order => :acc_cd)
    ac.each do |ac|
      jd = JournalDebit.arel_table
      # debit amount summary of this account
      cond = jd[:account_id].eq(ac.id)
      cond = cond.and(jd[:occur_on].gteq(beg_date))
      cond = cond.and(jd[:occur_on].lteq(end_date))
      deb_ttl = JournalDebit.where(cond).sum(:amount)

      jc = JournalCredit.arel_table
      # credit amount summary of this account
      cond = jc[:account_id].eq(ac.id)
      cond = cond.and(jd[:occur_on].gteq(beg_date))
      cond = cond.and(jd[:occur_on].lteq(end_date))
      cre_ttl = JournalCredit.joins(:journal_debit).where(cond).sum(:amount)

      # calculate balance 
      if deb_ttl > cre_ttl
        deb_bal = deb_ttl - cre_ttl
        cre_bal = 0
      else
        deb_bal = 0
        cre_bal = cre_ttl - deb_ttl
      end
      @records << {:account => ac, :deb_bal => deb_bal, :deb_ttl => deb_ttl,
                    :cre_ttl => cre_ttl, :cre_bal => cre_bal}
    end
    @records
  end
end
