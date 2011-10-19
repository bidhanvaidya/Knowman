class DateValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value < Time.now
      object.errors[attribute] << (options[:message] || "is not formatted properly") 
    end
  end
end
