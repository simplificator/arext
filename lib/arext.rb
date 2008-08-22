require File.join(File.dirname(__FILE__), 'arext', 'validations')
ActiveRecord::Base.send(:extend, Arext::Validations::ClassMethods)