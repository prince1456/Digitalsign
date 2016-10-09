json.extract! page, :id, :page_name, :page_body, :user_id, :template_id, :created_at, :updated_at
json.url page_url(page, format: :json)