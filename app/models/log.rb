class Log < ApplicationRecord
  belongs_to :user
  enum record_status: { fine: 0, low: 1, sick: 2 }

  enum colour_status: { light_brown: 0, brown: 1, black: 2, orange: 3, green: 4 }

  enum shape_status: { big: 0, small: 1, hard: 2, soft: 3, water: 4 }

  def record_status_score
    if fine?
      10
    elsif low?
      5
    else
      0
    end
  end

  def colour_status_score
    if light_brown?
      10
    elsif brown?
      8
    elsif black?
      5
    elsif orange?
      0
    else
      0
    end
  end

  def shape_status_score
    if big?
      10
    elsif small?
      4
    elsif hard?
      5
    elsif soft?
      2
    else
      1
    end
  end
# グラフの計算
  def array
    array = record_status_score,colour_status_score,shape_status_score
    array.sum.fdiv(array.length).round()
  end
end
