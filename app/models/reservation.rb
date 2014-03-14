class Reservation < ActiveRecord::Base
  
  belongs_to :user
  
  scope :current, -> { where(created_at: (first_day_of_current_week..first_day_of_next_week)) }

  private

  def self.first_day_of_current_week
    Date.today.beginning_of_week
  end

  def self.first_day_of_next_week
    first_day_of_current_week + 7.days
  end

end
