collection @sin_projects, object_root: false
attributes :name, :description, :betterplace_id,
  :small_picture_url, :big_picture_url
node(:link) { |sin_project| sin_project_url(sin_project.sin, sin_project, format: :json) }
