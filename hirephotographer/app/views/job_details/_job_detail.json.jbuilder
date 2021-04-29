json.extract! job_detail, :id, :created_at, :updated_at
json.url job_detail_url(job_detail, format: :json)