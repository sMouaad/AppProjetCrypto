json.extract! medical_record, :id, :title, :content, :user_id, :abe_attributes, :created_at, :updated_at
json.url medical_record_url(medical_record, format: :json)
