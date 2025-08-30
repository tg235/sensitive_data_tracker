class PagesController < ApplicationController
  def home
    @records = DataRecord.all
    @total = @records.count
    @sensitive = @records.where(is_sensitive: true).count
    @score = if @total > 0
               ((@total - @sensitive).to_f / @total * 100).round(2)
             else
               0
             end
    render :home   # force Rails to render the view
  end
end
