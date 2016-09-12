class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates_presence_of :release_year, if: :released
  validate :release_year_in_future?

  def release_year_in_future?
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Release date can't be in the future")
    end
  end
end
