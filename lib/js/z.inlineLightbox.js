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
                //document.location.hash = "#" + id;
                self.element.attr("id", id);
            }
        }
        if (self.containerElement) return;

        var o = self.element.offset();
        var po = self.parentElement.offset();
        var w = $(window);
        self.curtain = $("<div>")
            .addClass("inlineLightbox-curtain")
            .css({position: "absolute", left: 0, top: 0, width: w.width(), height: w.height(), opacity: 0.0})
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
                      var targetWidth = (self.width-2*self.options.padding);
                      var targetHeight = ((self.width-2*self.options.padding) / aspect);

                      // make sure the image does not extend below the document body
                      var h = self.containerElement.height()-self.img.height()+targetHeight;
                      var targetTop = po.top;
                      if ($(window).height()+$(document).scrollTop() < po.top+h) {
                          targetTop = $(window).height()+$(document).scrollTop() - h;
                      }

                      self.curtain.css({height: Math.max($(window).height()+$(document).scrollTop(), $("body").outerHeight(true))});
                      $(this)
                          .css({
                                   height: self.img.width()/aspect})
                          .animate({
                                       width: targetWidth,
                                       height: targetHeight
                                   }, 300);
                      self.containerElement.animate({left: po.left, top: targetTop, opacity: 1.0, width: self.width}, 300);

                  })
            .css({margin: self.options.padding});


        self.titleEl = null;
        if (self.img.attr("title") || $("p.caption", self.element).length) {
            // add caption
            self.titleEl = $("<div>")
                .addClass("caption")
                .css({margin: self.options.padding,
                      marginTop: 0})
                .html($("p.caption", self.element).html()||self.img.attr("title"))
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

