module Support
  module Tasks
    def create_task(form_id, options)
      within "##{form_id}" do
        fill_in 'task-title-field', with: options[:title]
      end
      find('#create-task').click
    end

    def delete_task(task)
      find("#delete-task-#{task.id}", visible: :hidden).click
    end

    def update_task_title(task, title)
      id = task.id
      find("#edit-task-#{id}", visible: :hidden).click
      within "#task-form-#{id}" do
        fill_in "task-title-#{id}", with: title
      end
      find("#edit-task-#{id}").click
    end

    def task_checkbox(task)
      find("#task-checkbox-#{task.id}")
    end

    def checkbox_state(task)
      task_checkbox(task)['aria-checked']
    end
  end
end
