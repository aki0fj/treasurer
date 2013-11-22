json.array!(@accounts) do |account|
  json.extract! account, :acc_cd, :acc_name, :acc_type
  json.url account_url(account, format: :json)
end
