/*
 * @brief jQuery css clip animation support
 * @author hon2a
 * @version 1.0.0
 * 
 * inspired by Jim Palmer's plugin jquery.animate.clip
 * Released under the MIT license.
 */
(function(jQuery){
	jQuery.fx.step.clip = function (fx) {
		if ($(fx.elem).is(':visible')) {
			if (fx.start == 0) {
				var emCoef = ( parseInt($(fx.elem).css('fontSize')) * 1.333 ),
					horizontalPercentCoef = $(fx.elem).width() / 100,
					verticalPercentCoef = $(fx.elem).height() / 100,
					regExp = {
						parseSize: /^(\d{1,}(\.\d+)?)(px|em|%)$/,
						stripRect: /rect\(([^)]*)\)/,
						splitRect: /[,\s]\s*/,
						matchAuto: /^auto$/
					},
					autoSizes = ['0px', '101%', '105%', '0px'];
				var parseClipRect = function (rectStr) {
					var rect = ((typeof rectStr != 'string') || (rectStr == '') || (rectStr == 'auto'))
						? ['auto', 'auto', 'auto', 'auto']
						: rectStr.replace(regExp.stripRect, '$1').split(regExp.splitRect);
					$.each(rect, function (i, size) {
						var matches = regExp.parseSize.exec(size.replace(regExp.matchAuto, autoSizes[i]));
						rect[i] = parseFloat(matches[1]);
						switch (matches[3]) {
							case 'em':
								rect[i] *= emCoef;
								break;
							case '%':
								rect[i] *= ((i % 2) ? horizontalPercentCoef : verticalPercentCoef);
								break;
						}
					});
					return rect;
				};

				fx.start = parseClipRect(fx.elem.style.clip);
				fx.end = parseClipRect(fx.end);
			}

			var currentRect = [];
			for (var i = 0; i < 4; ++i) {
				currentRect.push((fx.pos * (fx.end[i] - fx.start[i])) + fx.start[i]);
			}
			fx.elem.style.clip = 'rect(' + currentRect.join('px ') + 'px)';
		} else {
			fx.elem.style.clip = 'auto';
		}
	}
})(jQuery);



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
            .css({position: "absolute", left: 0, top: 0, width: w.width(), bottom: 0, opacity: 0.0})
            .appendTo("body");
        self.curtain.animate({opacity: self.options.curtainOpactiy});
        self.curtain.click(function(){self.hide();});

        var pad = self.options.padding;

        self.containerElement = $("<div>")
            .addClass("inlineLightbox-container")
            .css({position: "absolute", left: o.left, top: o.top, opacity: 0.0, width: self.element.width()})
            .focus()
            .appendTo("body");

        var posx = Math.floor(100*(o.left-po.left)/(self.width-self.element.width()))+"%";
        var posy = "0%";

        $("<img>")
            .addClass("pad")
            .attr("src", self.element.attr("href"))
            .appendTo(self.containerElement)
            .click(function(){self.hide();})
            .css({
                     width: self.img.width()})
            .load(function() {
                      var aspect = $(this).width()/$(this).height();
                      console.log(aspect);
                      
                      var targetWidth = (self.width-2*self.options.padding);
                      var targetHeight = ((self.width-2*self.options.padding) / aspect);

                      $(this)
                          .css({
                                   height: self.img.width()/aspect})
                          .animate({
                                       width: targetWidth,
                                       height: targetHeight
                                   }, 300);
                      self.curtain.animate({height: Math.max($(window).height(), $("body").outerHeight(true), po.top+self.containerElement.height()-self.img.height()+targetHeight)}, 300);
                      //self.curtain.css({height: Math.max(self.curtain.height(), po.top+targetHeight)});

                      self.containerElement.animate({left: po.left, top: po.top, opacity: 1.0, width: self.width}, 300);
                      
                  })
            .css({margin: self.options.padding});
        
        
        self.titleEl = null;
        if (self.img.attr("title")) {
            // add caption
            self.titleEl = $("<div>")
                .addClass("caption")
                .css({margin: self.options.padding,
                      marginTop: 0})
                .html(self.img.attr("title"))
                .appendTo(self.containerElement);
        }
    },
    
    hide: function() {
        var self = this;
        self.curtain.animate({opacity: 0.0}, 150, function(){self.curtain.remove();});
        self.containerElement.animate({opacity: 0.0}, 150, function(){self.containerElement.remove();self.containerElement=null;});
        if (self.element.attr("id")) {
//            document.location.hash = "";
        }
    }



});

$.ui.inlineLightbox.defaults = 
{
    parent: "body",
    curtainOpactiy: .3,
    padding: 10
};

