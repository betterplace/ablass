(function() {

  define(["project", "project_view", "../../fixtures/projects"], function(Project, ProjectItemView, projects) {
    return describe("Model Project", function() {
      var project, project_view;
      project = new Project({
        id: 23,
        name: "Project Test",
        description: "Project description",
        icon: "httpishthing"
      });
      project_view = new ProjectItemView({
        model: project
      });
      it("should have attributes", function() {
        return expect(project.get("name")).toBe("Project Test");
      });
      return it("should parse a template with given attributes", function() {
        project_view.render();
        expect(project_view.$el).toBeTruthy();
        expect(project_view.$el.find("div.name").html()).toBe("Project Test");
        expect(project_view.$el.find("div.icon").html()).toMatch("src=\"httpishthing");
        return expect(project_view.$el.find("div.description").html()).toBe("Project description");
      });
    });
  });

}).call(this);
