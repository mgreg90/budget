class TransactionsController < ApplicationController
  
  before_filter :authorize
  
  def create_many_from_csv
    # data_as_arrays = CSV.parse(File.open(params[:transactions_file].tempfile))
    Transaction.from_csv(params[:transactions_file].tempfile)
    # kinda hacky here. Needs to not default to primary, but to last
    redirect_to account_path(current_user.primary_account.id)
  end
  
end
