$.widget("ui.imageSwap",
{
	_init: function() {
        var self=this;
        // preload
        $("<img>").attr("src", self.options.src);
        console.log(self.options.mode);
        
        this['setupSwap_'+self.options.mode]();
    },

    setupSwap_background: function() {
		var self = this;

        self.original = self.element.css("background-image");
        self.element
            .mouseover(function() {
                           self.element.css({backgroundImage: "url("+self.options.src+")"});
                       })
            .mouseout(function() {
                          self.element.css({backgroundImage: self.original});
                      });
    },

    setupSwap_foreground: function() {
		var self = this;
        var img = $("img:first", self.element);
        self.original = img.attr("src");
        self.element
            .mouseover(function() {
                           img.attr("src", self.options.src);
                       })
            .mouseout(function() {
                           img.attr("src", self.original);
                      });
    }
});

$.ui.imageSwap.defaults =
{
    mode: "foreground"
};
