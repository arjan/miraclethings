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
        self.zoomIcon = $("<img>").attr("src", "/lib/images/icon_zoom.png").hide();
        
        self.element.mouseover(function() {
                    var o = self.img.offset();
                    
                    var po = self.parentElement.offset();
                    var pad = (self.img.outerWidth()-self.img.width())/2;
                    self.zoomIcon
                        .appendTo(self.parentElement)
                        .css({position: "absolute", top: o.top-po.top+pad-1, left: self.img.outerWidth()+o.left-po.left-pad-self.zoomIcon.width()+1})
                        .show();
                })
            .mouseout(function() {
                          self.zoomIcon.hide();
                      });
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

/**
* hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+
* <http://cherne.net/brian/resources/jquery.hoverIntent.html>
* 
* @param  f  onMouseOver function || An object with configuration options
* @param  g  onMouseOut function  || Nothing (use configuration options object)
* @author    Brian Cherne brian(at)cherne(dot)net
*/
(function($){$.fn.hoverIntent=function(f,g){var cfg={sensitivity:7,interval:100,timeout:0};cfg=$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){$(ob).unbind("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev])}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev])};var handleHover=function(e){var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t)}if(e.type=="mouseenter"){pX=ev.pageX;pY=ev.pageY;$(ob).bind("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}}else{$(ob).unbind("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob)},cfg.timeout)}}};return this.bind('mouseenter',handleHover).bind('mouseleave',handleHover)}})(jQuery);
