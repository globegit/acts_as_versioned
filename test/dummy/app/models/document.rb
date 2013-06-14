class Document < ActiveRecord::Base
  attr_accessible :title, :body

  acts_as_versioned
end
