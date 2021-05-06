module ReservationsHelper
  def times
    times = ["10:00~",
             "11:00~",
             "12:00~",
             "13:00~",
             "14:00~",
             "15:00~",
             "16:00~"]
  end

   #予約状況を判断するメソッド
  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end

end
