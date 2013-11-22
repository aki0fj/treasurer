json.array!(@journal_debits) do |journal_debit|
  json.extract! journal_debit, 
  json.url journal_debit_url(journal_debit, format: :json)
end
