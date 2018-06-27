class Importer::Base
  require 'csv'

  def initialize(filename)
    @filename = filename
  end

  def import!
    if destroy_before_import
      puts 'Delete records'
      class_name.destroy_all
    end

    puts "Creating Records."
    parse_file do |record|
      create record
    end

    class_name.count
  end

protected

  def self.def(varname, value)
    define_method(varname) do
      value
    end
  end

  def self.fields(fields)
    self.def('fields', fields)
  end

  def self.class_name(class_name)
    self.def('class_name', class_name.constantize)
  end

  def self.start_on(start_on = 0)
    self.def('start_on', start_on)
  end

  def self.destroy_before_import(destroy = true)
    self.def('destroy_before_import', destroy)
  end

  #default values
  start_on 0
  destroy_before_import true


  def parse_file
    first = true
    categories = {}
    CSV.foreach(@filename) do |csv_fields|
      if first
        first = false
      else
        record = get_record(csv_fields)
        yield record
        print "."
      end
    end
    puts ""
  end

  def get_record(csv_fields)
    if fields.is_a?(Array)
      get_array_record(csv_fields)
    elsif fields.is_a?(Hash)
      get_hash_record(csv_fields)
    end
  end

  def get_array_record(csv_fields)
    record = OpenStruct.new
    fields.each_with_index do |field, index|

      if field.is_a?(Hash)
        field.each do |sub_key, sub_value|
          record[sub_key] = csv_fields[sub_value].try(:strip)
        end
      else
        record[field] = csv_fields[index+start_on].try(:strip)
      end

    end

    record
  end

  def get_hash_record(csv_fields)
    record = OpenStruct.new
    fields.each do |key, value|
      record[key] = csv_fields[value].try(:strip)
    end
    record
  end

  def create(record)
    class_name.create record.to_h
  end

end