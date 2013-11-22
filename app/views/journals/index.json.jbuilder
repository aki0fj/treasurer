json.array!(@journals) do |journal|
  json.extract! journal, :occur_on, :deb_acc_cd, :cre_acc_cd, :amount, :description, :p_r
  json.url journal_url(journal, format: :json)
end
