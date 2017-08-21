require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @cols if @cols
    table_cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    @cols = table_cols.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) {self.attributes[col]}
      define_method("#{col}=") {|val| self.attributes[col] = val}
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.to_s.tableize
  end

  def self.all
    # ...
    table_cols = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    parse_all(table_cols)
  end

  def self.parse_all(results)
    # ...
    res = []
    results.each do |hash|
      res << self.new(hash)
    end
    res
  end

  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?
    SQL
    parse_all(result).first
  end

  def initialize(params = {})
    # ...
    cols = self.class.columns
    params.each do |k,v|
      k_sym = k.to_sym
      raise "unknown attribute '#{k_sym}'" unless cols.include?(k_sym)
      self.send("#{k_sym}=", v)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
