require "active_support/time"

class Builders::DateCalculator < SiteBuilder
  def build
    helper :next_occurring_date do |date|
      if date < Date.today
        date += 1.year
      end

      date
    end
  end
end
