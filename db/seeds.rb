puts "*" * 100
puts "Seed Start!"
ApplicationRecord.transaction do
  it = IssuerType.create! name: 'Bank'
  i = Issuer.create! name: ENV['MIKE_BANK'], issuer_type: it
  u = User.create! first_name: 'Mike', last_name: 'Gregory', middle_initial: 'T', email: ENV['MIKE_EMAIL'], password: ENV['MIKE_PASSWORD']
  a = Account.create! user: u, issuer: i, name: "#{ENV['MIKE_BANK']} Checking", primary: true, initial_balance_in_cents: ENV['MIKE_INITIAL_BALANCE']
  Card.create! name: "My #{ENV['MIKE_BANK']} Card", account: a
end
puts "Seed End!"
puts "*" * 100