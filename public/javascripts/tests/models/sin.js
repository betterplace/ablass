(function() {

  define(["sin", "sin_view"], function(Sin, SinItemView) {
    return describe("Model Sin", function() {
      var sin, sin_view;
      sin = new Sin({
        name: "name",
        icon: "icon",
        explanation: "text",
        id: 23
      });
      sin_view = new SinItemView({
        model: sin
      });
      it("should have attributes", function() {
        return expect(sin.get("name")).toBe("name");
      });
      return it("should parse a template with given attributes", function() {
        sin_view.render();
        expect(sin_view.$el).toBeTruthy();
        expect(sin_view.$el.find("div.name").html()).toBe("name");
        expect(sin_view.$el.find("div.icon").html()).toMatch(/<img/);
        return expect(sin_view.$el.find("div.explanation").html()).toBe("text");
      });
    });
  });

}).call(this);
