json.extract! task, :id, :name, :description, :list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
