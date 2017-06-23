require "rspec"
require_relative "tasklist"
require_relative "due_date"
require_relative "an"

# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: An Anniversary has a month and a day.
# Hint: An Anniversary is a special kind of DueDateTask where the due date changes depending on the current date (override the due_date method to return the next annivesary date).
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.

describe An do
  it "should be a anniversary" do
    expect{An.new}.to_not raise_error
  end
  it "should set a date with a year later" do
    an = An.new
    an.set_an_date(05, 25)
    expect(an.an_date).to eq(Date.new((Date.today.year + 1), 05, 25))
  end
  it "should be same year if date has not passed" do
    an = An.new
    an.set_an_date(07, 25)
    expect(an.an_date).to eq(Date.new(2017, 07, 25))
  end
  it "should have info you can pull" do
    an = An.new("anniversary")
    an.set_an_date(07, 25)
    an.add_description("my anniversary")
    expect(an.info).to eq("anniversary: my anniversary  Due date: 2017-07-25")
  end
  it "should sort by due task" do
    task1 = Task.new("task1")
    task1.mark_done
    task2 = Task.new("task2")
    task3 = Task.new("task3")
    task4 = DueDateTask.new("task4")
    task4.set_date(2014, 12, 22)
    task4.mark_done
    task5 = DueDateTask.new("task5")
    task5.set_date(2017, 07, 20)
    task6 = DueDateTask.new("task6")
    task6.set_date(2019, 05, 23)
    task7 = An.new("task7")
    task7.set_an_date(05, 25)
    task8 = An.new('task8')
    task8.set_an_date(06, 12)
    tasklist = Tasklist.new
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    tasklist.add_task(task3)
    tasklist.add_duedate_task(task4)
    tasklist.add_duedate_task(task5)
    tasklist.add_duedate_task(task6)
    tasklist.add_duedate_task(task7)
    tasklist.add_duedate_task(task8)
    tasklist.show_incomplete
    expect(tasklist.sort_list_list).to match_array([task5, task7, task8, task6, task2, task3])
  end
  it "should pull tasks due this month" do
    task1 = Task.new("task1")
    task1.mark_done
    task2 = Task.new("task2")
    task3 = Task.new("task3")
    task4 = DueDateTask.new("task4")
    task4.set_date(2014, 12, 22)
    task4.mark_done
    task5 = DueDateTask.new("task5")
    task5.set_date(2017, 06, 20)
    task6 = DueDateTask.new("task6")
    task6.set_date(2019, 06, 23)
    task7 = An.new("task7")
    task7.set_an_date(05, 25)
    task8 = An.new('task8')
    task8.set_an_date(06, 12)
    tasklist = Tasklist.new
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    tasklist.add_task(task3)
    tasklist.add_duedate_task(task4)
    tasklist.add_duedate_task(task5)
    tasklist.add_duedate_task(task6)
    tasklist.add_duedate_task(task7)
    tasklist.add_duedate_task(task8)
    tasklist.show_incomplete
    tasklist.sort_list_list
    expect(tasklist.month_list).to match_array([task8, task5, task6, task2, task3])
  end
end
