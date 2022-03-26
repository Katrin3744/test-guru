class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(:base, "must be a valid URL") unless url_valid?(value)
  end

  def url_valid?(url)
    url =~ URI::regexp
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end
end
