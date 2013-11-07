class PagesController < ApplicationController
  def home
    @result = []
    User.first(10).each do |u|
      values = [u.id]
      start_time = Time.now
      values << u.entries.where("published_at >= ? AND published_at < ?", 1.month.ago, DateTime.now).count
      values << Time.now - start_time
      @result << values
    end
  end
end
