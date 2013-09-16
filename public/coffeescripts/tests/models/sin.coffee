define ["sin", "sin_view"], (Sin, SinItemView)->

  describe "Model Sin", ()->
    sin = new Sin
      title: "title"
      icon: "icon"
      description: "text"
      id: 23

    sin_view = new SinItemView( {model: sin} )
    it "should have attributes", ()->
      expect(sin.get("title")).toBe("title")


    it "should parse a template with given attributes", ()->
      sin_view.render()
      expect(sin_view.$el).toBeTruthy()
      expect(sin_view.$el.find("div.title").html()).toBe("title")
      expect(sin_view.$el.find("div.icon").html()).toBe("icon")
      expect(sin_view.$el.find("div.description").html()).toBe("text")
