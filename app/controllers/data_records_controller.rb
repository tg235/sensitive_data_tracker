require 'csv'
class DataRecordsController < ApplicationController
  def upload
    file = params[:file]
    CSV.foreach(file.path, headers: true) do |row|
      sensitive = false
      sensitive ||= row['email'] =~ /\A[^@\s]+@[^@\s]+\z/
      sensitive ||= row['phone'] =~ /\A\d{10}\z/
      sensitive ||= row['pan'] =~ /\A[A-Z]{5}[0-9]{4}[A-Z]{1}\z/
      sensitive ||= row['aadhaar'] =~ /\A\d{12}\z/
      DataRecord.create(row.to_h.merge(is_sensitive: sensitive))
    end
    redirect_to root_path
  end

  def stats
    total = DataRecord.count
    sensitive = DataRecord.where(is_sensitive: true).count
    render json: { total_records: total, sensitive_records: sensitive, compliance_score: total > 0 ? ((total - sensitive)*100/total) : 100 }
  end
end
