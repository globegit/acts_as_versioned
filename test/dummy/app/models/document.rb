class Document < ActiveRecord::Base
  attr_accessible :title, :body, :comments, :dont_version

  acts_as_versioned :versioned_columns => ->(name) { name !~ /dont_version/ }
end
