require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def bonus(multiplier)
    p "wtf"
    @salary * multiplier
  end

  def boss=(boss)
    @boss = boss
    @boss.add_employee(self) unless @boss.nil?
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
    @employees = []
  end

  def bonus(multiplier)
    p "tfw"
    sum_salaries * multiplier
  end

  def sum_salaries
    sum = 0
    @employees.each do |emp|
      if emp.is_a?(Manager)
        sum += emp.sum_salaries
      end
      sum += emp.salary
    end
    sum
  end

  def add_employee(employee)
    @employees << employee
  end
end

def setup
  $ned = Manager.new("Ned", "Founder", 1_000_000)
  $darren = Manager.new("Darren", "TA Manager", 78_000, $ned)
  $shawna = Employee.new("Shawna", "TA", 12_000, $darren)
  $david = Employee.new("David", "TA", 10_000, $darren)
end
