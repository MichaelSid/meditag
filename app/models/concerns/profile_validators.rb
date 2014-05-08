require 'active_support/concern'

module ProfileValidators
  
  extend ActiveSupport::Concern

  UK_PHONE_NUMBER = Regexp.new(/\A((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?\Z/)

end