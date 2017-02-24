5.times do
  project = Project.create(
    title: FFaker::Job.title,
    completed_at: rand(5..50).days.from_now
  )

  rand(2..10).times do
    Task.create do |task|
      task.title = FFaker::Job.title
      task.checked = [true, false].sample
      task.project_id = project.id
    end
  end
end
