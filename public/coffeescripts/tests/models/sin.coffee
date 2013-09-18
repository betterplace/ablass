define ["sin", "sin_view"], (Sin, SinItemView)->

  describe "Model Sin", ()->
    sin = new Sin
      name: "name"
      icon: "icon"
      explanation: "text"
      id: 23

    sin_view = new SinItemView( {model: sin} )
    it "should have attributes", ()->
      expect(sin.get("name")).toBe("name")


    it "should parse a template with given attributes", ()->
      sin_view.render()
      expect(sin_view.$el).toBeTruthy()
      expect(sin_view.$el.find("div.name").html()).toBe("name")
      expect(sin_view.$el.find("div.icon").html()).toMatch(/<img/)
      expect(sin_view.$el.find("div.explanation").html()).toBe("text")
