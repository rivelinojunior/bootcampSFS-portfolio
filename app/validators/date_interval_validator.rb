class DateIntervalValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    return unless @record.start_date.present?

    validate_future_start_date
    validate_start_date_after_end_date if @record.end_date.present?
  end

  private

  def validate_future_start_date
    return unless @record.start_date >= Time.zone.now

    @record.errors.add(:start_date, 'must be a past date')
  end

  def validate_start_date_after_end_date
    return unless @record.start_date >= @record.end_date

    @record.errors.add(:start_date, 'must be a date before end date')
  end
end
