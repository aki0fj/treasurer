class CreateJournalCredits < ActiveRecord::Migration
  def change
    create_table :journal_credits do |t|
      t.integer :journal_debit_id
      t.integer :acc_id

      t.timestamps
    end
  end
end
