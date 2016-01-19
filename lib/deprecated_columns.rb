require "deprecated_columns/version"
require "deprecated_columns/warn_on_column_removal"

module DeprecatedColumns
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def deprecated_columns(*names)
      unless self.respond_to?(:deprecated_column_list)
        class_attribute :deprecated_column_list
        self.deprecated_column_list = []
      end

      self.deprecated_column_list += names.map(&:to_s)
    end

    class_eval do
      def attribute_names
        super.reject { |name| deprecated_column_list.include?(name) }
      end

      def columns
        super.reject { |column| deprecated_column_list.include?(column.name) }
      end
    end
  end
end

ActiveRecord::Base.send :include, DeprecatedColumns
ActiveRecord::Migration.send :prepend, WarnOnColumnRemoval
