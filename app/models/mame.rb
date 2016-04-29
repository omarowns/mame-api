class Mame < ApplicationRecord
  validates_presence_of :text, :author

  def quote
    "#{id}. #{text} - #{author}"
  end
end
