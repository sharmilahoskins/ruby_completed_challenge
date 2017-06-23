require 'date'
class An < DueDateTask
  def initialize (title = "title")
    super
    @title = title
    @due_date
    @info
    @done = false
  end
  def set_an_date(month, day)
    if month <= Date.today.month
      @due_date = Date.new((Date.today.year + 1), month, day)
    elsif month == Date.today.month && day < Date.today.day
      @due_date = Date.new((Date.today.year + 1), month, day)
    else
      @due_date = Date.new(Date.today.year, month, day)
    end
  end
  def info
    @info = "#{@title}: #{@description}  Due date: #{@due_date}"
  end
  def an_date
    @due_date
  end
end
