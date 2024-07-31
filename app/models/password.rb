class Password < ApplicationRecord
  validates :length, presence: true, inclusion: { in: 4..12 }
  validates :case_option, presence: true, inclusion: { in: %w(uppercase lowercase mixed capitalize) }
  validates :add_non_letter, inclusion: { in: [true, false] }
  validates :non_letter_count, presence: true, inclusion: { in: 0..2 }, if: :add_non_letter?
  validate :non_letter_count_consistency

  private

  def non_letter_count_consistency
    if add_non_letter && non_letter_count.nil?
      errors.add(:non_letter_count, "must be specified if add non-letter is checked")
    elsif !add_non_letter && non_letter_count.to_i > 0
      errors.add(:non_letter_count, "must be 0 if add non-letter is not checked")
    end
  end
end