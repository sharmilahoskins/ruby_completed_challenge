class Task
  def initialize (title = "title")
    @title = title
    @description
    @done = false
    @info

  end
  def title
    @title
  end
  def add_description(description)
    @description = description
  end
  def description
    @description
  end
  def mark_done
    @done = true
  end
  def done
    @done
  end
  def info
    @info = "#{@title} : #{@description}  Is task done?  #{@done}"
  end
end

class Tasklist
  def initialize
    @list = []
    @duedate_list = []
    @completed_list = []
    @incomplete_list = []
    @due_today = []
    @list_list = []
    @month_list = []
  end
  def show_list
    @list
  end
  def add_task(task)
    @list << task
  end
  def add_duedate_task(task)
    @duedate_list << task
  end
  def duedate_list
    @duedate_list
  end
  def show_completed
    @completed_list = @list
    @completed_list = @completed_list.reject{|x| x.done == false}
  end
  def show_incomplete
    @incomplete_list = @list
    @incomplete_list = @incomplete_list.reject{|x| x.done == true }
  end
  def show_due
    @due_today = @duedate_list
    @due_today = @due_today.reject{|x| x.due_date != Date.today }
  end
  def list_list
    @list_list
  end
  def sort_list_list
    new_due = @duedate_list.reject{|x| x.done == true}
    new_due = new_due.sort_by{|a| a.due_date}
    @list_list = new_due.concat(@incomplete_list)
  end
  def month_list
    new_due = @duedate_list.reject{|x| x.due_date.month != Date.today.month}
    new_due = new_due.sort_by{|a| a.due_date}
    @month_list = new_due.concat(@incomplete_list)
  end
end
