module CoachesHelper
  def find_coaches(category = nil)
    if category
      find_coaches_by(category)
    else
      coaches
    end
  end

  def find_en_coaches
    en_coaches
  end

  def next_coach(current_coach)
    index = coaches.find_index { |coach| coach == current_coach }
    coaches[index.next % coaches.count]
  end

  def next_en_coach(current_coach)
    index = en_coaches.find_index { |coach| coach == current_coach }
    en_coaches[index.next % en_coaches.count]
  end

  private

  def find_coaches_by(category)
    coaches.select do |coach|
      coach['categories'] && coach['categories'].include?(category)
    end
  end

  def find_en_coaches_by(category)
    en_coaches.select do |coach|
      coach['categories'] && coach['categories'].include?(category)
    end
  end

  def coaches
    data.coaches
  end

  def en_coaches
    data.coaches_en
  end

end
