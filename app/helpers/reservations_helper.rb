module ReservationsHelper
  WDAYS = [ "Mon", "Tue", "Wed", "Thu", "Fri" ]

  HOURS = [ "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00",
            "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00" ]

  def week_days
    WDAYS
  end

  def hours
    HOURS
  end

end
