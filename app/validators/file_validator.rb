class FileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @record = record
    @value = value
    @attribute = attribute
    perform_validations
  end

  private

  def perform_validations
    return unless @value.attached?

    validate_mime_type
    validate_size
  end

  def validate_mime_type
    return if permitted_mime_type?

    @record.errors.add(@attribute, 'doesn\'t have a permitted mime type')
  end

  def validate_size
    return if permitted_size?

    @record.errors.add(@attribute, 'is too big')
  end

  def permitted_mime_type?
    return true unless options[:mime_types].present?

    mime = Mime::Type.lookup @value.attachment.blob.content_type
    permitted_extensions = options[:mime_types]
    mime.symbol.present? && permitted_extensions.include?(mime.symbol)
  end

  def permitted_size?
    return true unless options[:max_size_in_bytes].present?

    @value.attachment.blob.byte_size <= options[:max_size_in_bytes]
  end
end
