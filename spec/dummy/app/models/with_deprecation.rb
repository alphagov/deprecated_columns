class WithDeprecation < ActiveRecord::Base
  deprecated_columns :title
end
