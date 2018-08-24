require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    c3po = Robot.new
    c3po.foreign_model = true
    c3po.needs_repairs = true
    # act
    result = c3po.station
    # assert
    assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    r2d2 = Robot.new
    r2d2.vintage_model = true
    r2d2.needs_repairs = true
    # act
    result = r2d2.station
    # assert
    assert_equal(2, result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    megazord = Robot.new
    megazord.needs_repairs = true
    # act
    result = megazord.station
    # assert
    assert_equal(3, result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    bender = Robot.new

    # act
    result = bender.station
    # assert
    assert_equal(4, result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    bicentennialman = Robot.new
    bicentennialman.todos = []
    # act
    result = bicentennialman.prioritize_tasks
    # assert
    assert result == -1
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    tin_man = Robot.new
    tin_man.todos = ["Lubricate", "Charge", "Switch on"]
    # act
    result = tin_man.prioritize_tasks
    # assert
    assert result == "Switch on"
  end

  def test_workday_on_day_off_returns_false

    # arrange
    canadarm = Robot.new
    canadarm.day_off = "Saturday"
    # act
    result = canadarm.workday?("Saturday")
    # assert
    assert result == false
  end

  def test_workday_not_day_off_returns_true
    
    # arrange
    robocop = Robot.new
    robocop.day_off = "Saturday"
    # act
    result = robocop.workday?("Monday")
    # assert
    assert result == true
  end

end
