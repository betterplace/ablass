define ["project", "project_view", "../../fixtures/projects"], (Project, ProjectItemView, projects)->

  describe "Model Project", ()->
    project = new Project
      id: 23
      name: "Project Test"
      description: "Project description"
      icon: "httpishthing"


    project_view = new ProjectItemView( {model: project} )

    it "should have attributes", ()->
      expect(project.get("name")).toBe("Project Test")


    it "should parse a template with given attributes", ()->
      project_view.render()
      expect(project_view.$el).toBeTruthy()
      expect(project_view.$el.find("div.name").html()).toBe("Project Test")
      expect(project_view.$el.find("div.icon").html()).toMatch("src=\"httpishthing")
      expect(project_view.$el.find("div.description").html()).toBe("Project description")
