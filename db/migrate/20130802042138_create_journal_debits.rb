class CreateJournalDebits < ActiveRecord::Migration
  def change
    create_table :journal_debits do |t|
      t.date :occur_on
      t.integer :acc_id
      t.decimal :amount , :precision => 17, :scale => 2, :default => 0
      t.string :description
      t.integer :p_r

      t.timestamps
    end
  end
end
