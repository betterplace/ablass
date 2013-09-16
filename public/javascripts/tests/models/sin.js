(function() {

  define(["sin", "sin_view"], function(Sin, SinItemView) {
    return describe("Model Sin", function() {
      var sin, sin_view;
      sin = new Sin({
        title: "title",
        icon: "icon",
        description: "text",
        id: 23
      });
      sin_view = new SinItemView({
        model: sin
      });
      it("should have attributes", function() {
        return expect(sin.get("title")).toBe("title");
      });
      return it("should parse a template with given attributes", function() {
        sin_view.render();
        expect(sin_view.$el).toBeTruthy();
        expect(sin_view.$el.find("div.title").html()).toBe("title");
        expect(sin_view.$el.find("div.icon").html()).toBe("icon");
        return expect(sin_view.$el.find("div.description").html()).toBe("text");
      });
    });
  });

}).call(this);
