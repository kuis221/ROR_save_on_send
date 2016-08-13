/*
 * Transposh v0.9.6.0
 * http://transposh.org/
 *
 * Copyright 2014, Team Transposh
 * Licensed under the GPL Version 2 or higher.
 * http://transposh.org/license
 *
 * Date: Sun, 21 Dec 2014 01:15:33 +0200
 */
(function(a){a(".tp_help").live("click",function(b){b.preventDefault();window.scrollTo(0,0);a("#tab-link-"+jQuery(this).attr("rel")+" a").trigger("click");a("#contextual-help-link").hasClass("screen-meta-active")||a("#contextual-help-link").trigger("click")})})(jQuery);
