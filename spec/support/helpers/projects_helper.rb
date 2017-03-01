module Support
  module Projects
    def choose_project(project)
      first('.project-link', text: project.title).click
      sleep 1
    end

    def delete_project
      find('#delete-project').click
    end

    def update_project_title(title)
      find('#edit-project').click
      within '#project-form' do
        fill_in 'title-field', with: title
      end
      find('#edit-project').click
    end
  end
end
