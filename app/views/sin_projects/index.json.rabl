collection @sin_projects, object_root: false
attributes :id, :name, :description, :betterplace_id, :icon
node(:link) { |sin_project| sin_project_url(sin_project.sin, sin_project, format: :json) }

