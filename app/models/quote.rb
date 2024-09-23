class Quote < ApplicationRecord
  validates :name, presence: true
  belongs_to :company

  scope :ordered, -> { order(created_at: :desc) }

  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  after_update_commit -> { broadcast_replace_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quote_#{id}" }
  after_destroy_commit -> { broadcast_remove_to "quotes", target: "quote_#{id}" }


  # SAME AS

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # SAME AS
  # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

  # BROADCAST TO SPECIFIC COMPANY
  # broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
