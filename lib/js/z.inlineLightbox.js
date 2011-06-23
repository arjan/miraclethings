/* z.inlineLightbox.js
----------------------------------------------------------

@author Arjan Scherpenisse <arjan@scherpenisse.net>

Copyright 2011 Arjan Scherpenisse <arjan@scherpenisse.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
 
http://www.apache.org/licenses/LICENSE-2.0
 
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

---------------------------------------------------------- */

$.widget("ui.inlineLightbox", 
{
	_init: function() {
		var self = this;
        
        self.parentElement = self.element.parents(self.options.parent).first();

        self.offset = self.parentElement.offset();
        self.width = self.parentElement.width();

        self.img = $("img:first", self.element);
        self.aspect = self.img.width() / self.img.height();

        self.element.click(function(e) {
                               self.clicked(e);
                           });

        if (self.element.attr("id")) {
            if (document.location.hash == "#" + self.element.attr("id")) {
                self.clicked();
            }
        }
	},
    
    clicked: function(e) {
        var self = this;
        
        if (e) {
            e.preventDefault();
        }

        if (self.element.attr("id")) {
            if (document.location.hash != "#" + self.element.attr("id")) {
                var id = self.element.attr("id");
                self.element.attr("id", "");
                document.location.hash = "#" + id;
                self.element.attr("id", id);
            }
        }
        if (self.containerElement) return;

        var o = self.element.offset();
        var po = self.parentElement.offset();
        var w = $(window);
        self.curtain = $("<div>")
            .addClass("inlineLightbox-curtain")
            .css({position: "absolute", left: 0, top: 0, width: w.width(), height: Math.max(w.height(), $("body").outerHeight(true)), opacity: 0.0})
            .appendTo("body");
        self.curtain.animate({opacity: self.options.curtainOpactiy});
        self.curtain.click(function(){self.hide();});

        self.containerElement = $("<div>")
            .addClass("inlineLightbox-container")
            .css({position: "absolute", left: o.left, top: o.top, width: self.element.width(), height: self.element.height(), opacity: 0.0})
            .focus()
            .appendTo("body");

        $("<div>")
            .addClass("pad")
            .appendTo(self.containerElement)
            .click(function(){self.hide();})
            .css({width: self.width-2*self.options.padding, height: (self.width-2*self.options.padding)/self.aspect, margin: self.options.padding})
            .css({backgroundImage: "url(" + self.element.attr("href") +")", backgroundRepeat: "no-repeat",
                  backgroundPositionX: po.left-o.left, backgroundPositionY: po.top-o.top, opacity: 0.0})
            .animate({backgroundPositionX: 0, backgroundPositionY: 0, opacity: 1.0}, 300);

        var titleEl = null;
        var titleHeight = 0;
        if (self.img.attr("title")) {
            // add caption
            titleEl = $("<div>")
                .addClass("caption")
                .css({margin: self.options.padding,
                      marginTop: 0})
                .html(self.img.attr("title"))
                .appendTo(self.containerElement);
            titleHeight = titleEl.height()+self.options.padding;
        }

        var w2 = self.parentElement.width();
        self.containerElement.animate({left: po.left, top: po.top, width: w2, height: (w2 / self.aspect)+self.options.padding+titleHeight, opacity: 1.0}, 300);
    },
    
    hide: function() {
        var self = this;
        self.curtain.animate({opacity: 0.0}, 150, function(){self.curtain.remove();});
        self.containerElement.animate({opacity: 0.0}, 150, function(){self.containerElement.remove();self.containerElement=null;});
        if (self.element.attr("id")) {
            document.location.hash = "";
        }
    }



});

$.ui.inlineLightbox.defaults = 
{
    parent: "body",
    curtainOpactiy: .3,
    padding: 10
};

