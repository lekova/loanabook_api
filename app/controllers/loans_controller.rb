class LoansController < ApplicationController

  private
  def book_params
    params.require(:book).permit(:id, :loaner_id, :borrower_id, :date_loaned, :loan_duration)
  end
end
