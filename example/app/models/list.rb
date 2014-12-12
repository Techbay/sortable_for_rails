class List < ActiveRecord::Base
  default_scope { order(index: :asc) }
end
