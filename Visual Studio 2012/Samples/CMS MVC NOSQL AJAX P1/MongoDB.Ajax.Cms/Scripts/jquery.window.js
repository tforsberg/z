
/*
jQuery Window 8 Aero Plugin 1.0

http://nasa8x.com
http://nasa8x.com/demo/jquery-window-8-aero-plugin/
Copyright (c) 2012 Nasa8x

Dual licensed under the MIT and GPL licenses:
http://www.opensource.org/licenses/mit-license.php
http://www.gnu.org/licenses/gpl.html
*/


(function ($) {


    $.extend({

        WindowManager: {

            stories: [],
            create: function (o) {
                var win = new $.Window(o);
                this.stories.push(win);
                return win;
            },
            closeAll: function () {
                $.each(this.stories, function (i, win) {
                    win.close();
                });
            },
            removeAll: function () {
                $.each(this.stories, function (i, win) {
                    win.remove();
                });

                this.stories = [];
            },
            minimizeAll: function () {
                $.each(this.stories, function (i, win) {
                    win.minimize();
                });
            }



        }

    });





    $.Window = function (o) {

        this.opts = $.extend(true, {}, this.defaults, o || {});;
        this.init();
    };

    $.Window.prototype = {
        defaults: {
            theme: 'window8',
            title: 'Window Title',
            modal: false,           // allow modal background
            draggable: true, // allow window draggable requried jquery ui draggable
            resizable: true, // allow window resizable requried jquery ui resizable
            position: 'top',   //'left','right','bottom'
            easing: 'swing',
            duration: 500,
            width: 600,
            height: 450,
            maxWidth: 0,
            maxHeight: 0,
            minWidth: 0,
            minHeight: 0,
            zIndex: 9999,
            maximize: true,
            minimize: true,
            margin: {
                top: 10,
                left: 10,
                bottom: 15,
                right: 15
            },
            taskbar: {
                dock: '', // id of taskbar : "#window-taskbar"
                icon: '', // when min icon : 'images/icon.png'
                width: 100,
                height: 30
            },
            show: 1,         // 1: auto show when create 
            scroll: true,
            destroy: 1,     // destroy when close
            status: '',     // set window status
            url: '',
            type: '',        // iframe | ajax | html
            onInit: null,
            afterInit: null,
            onShow: null,
            afterShow: null,
            onClose: null,
            afterClose: null,
            onAjax: null,
            afterAjax: null,
            onMin: null,
            afterMin: null,
            onMax: null,
            afterMax: null

        },
        tmp: '<div id="{0}" class="window-container">\
                            <table class="window-wrapper">\
                                <tr>\
                                    <td class="box-t-l"/><td class="box-t-c draggable" id="{0}_top"><div id="{0}_title" class="box-title"></div></td><td class="box-t-r"/>\
                                </tr>\
                                <tr>\
                                    <td class="box-m-l" id="{0}_left"/>\
                                    <td class="box-m-c"> \
                                          <div id="{0}_loading" class="window-loading"></div>\
                                          <div class="window-control">\
                                                <a id="{0}_close" href="javascript:void(0)" class="window-close"><span></span></a>\
                                                <a id="{0}_max" href="javascript:void(0)" class="window-max"><span></span></a>\
                                                <a id="{0}_min" href="javascript:void(0)" class="window-min"><span></span></a>\
                                         </div>\
                                        <iframe id="{0}_iframe" class="window-body" frameborder="0"></iframe>\
                                        <div id="{0}_body" class="window-body">\
                                            <div id="{0}_content" class="window-content"></div>\
                                        </div>\
                                        <div id="{0}_status" class="window-status" />\
                                        <div class="resizable" />\
                                     </td>\
                                     <td class="box-m-r" id="{0}_right" />\
                                </tr>\
                                <tr>\
                                <td class="box-b-l"/><td class="box-b-c" id="{0}_bottom" /><td class="box-b-r"/>\
                                </tr>\
                        </table>\
                  </div>',
        undefined: function () {
            for (var i = 0; i < arguments.length; i++)
                if (typeof arguments[i] != 'undefined') return false;
            return true;
        },

        toArguments: function (array) {
            return $.map(array, function (a) {
                return $(a).val();
            });
        },
        isNullOrEmpty: function (value) {
            if (value) {
                if (typeof (value) == 'string') {
                    if (value.length > 0)
                        return false;
                }
                if (value != null)
                    return false;
            }
            return true;

        },
        format: function (source) {

            var result = source;
            $.each(arguments, function (i, n) {
                result = result.replace(new RegExp("\\{" + (i - 1) + "\\}", "g"), n);
            });
            return result;
        },

        viewport: function () {

            var w = $(window);
            return { height: w.height(), width: w.width(), top: w.scrollTop(), left: w.scrollLeft() };

        },

        objectToArgs: function (o) {
            var type = typeof (o);
            var a = [];
            if (type == "object") {
                for (var key in o) {
                    if (typeof (o[key]) == "object") {
                        this.objectToArgs(o[key]);
                    } else {
                        a.push(key + '=' + encodeURIComponent(o[key]));
                    }

                }
                return a.join('&');
            }
            return '';
        },

        queryStringToObject: function (url) {
            var o = {};
            if (!this.undefined(url) && !$.isArray(url) && url.indexOf('?') >= 0) {
                var qs = url.split('?')[1];
                var pairs = qs.split('&');
                $.each(pairs, function (i, v) {
                    var pair = v.split('=');
                    o[pair[0]] = pair[1];
                });
            }
            return o;

        },

        getObj: function (a) {
            var b = !this.undefined(a) ? '_' + a : '';
            return $(this.format('#{0}{1}', this.Id, b));
        },
        I: function () {
            return this.getObj();
        },
        getTitle: function () {
            return this.getObj('title');
        },

        getBody: function () {
            return this.opts.type == 'iframe' ? this.getObj('iframe') : this.getObj('body');
        },

        getContent: function () {
            return this.getObj('content');
        },
        getClose: function () {
            return this.getObj('close');
        },
        getMax: function () {
            return this.getObj('max');
        },

        getMin: function () {
            return this.getObj('min');
        },

        getStatus: function () {
            return this.getObj('status');
        },

        getLoading: function () {
            return this.getObj('loading');
        },


        parseSize: function (width, height) {

            //var o = this.options;
            var o = this.opts;

            if (o.maxWidth > 0 && width > o.maxWidth)
                width = o.maxWidth;

            if (o.minWidth > 0 && width < o.minWidth)
                width = o.minWidth;

            if (o.minHeight > 0 && height < o.minHeight)
                width = o.minHeight;

            if (o.maxHeight > 0 && height > o.maxHeight)
                width = o.maxHeight;

            return { width: parseInt(width), height: parseInt(height) };

        },

        showLoading: function () {
            var l = this.getLoading();
            var w = l.outerWidth();
            var h = l.outerHeight();
            var m = this.I();
            var y = ((m.width() - w) / 2);
            var x = ((m.height() - h) / 2);
            l.css({ top: x, left: y }).show();

        },

        hideLoading: function () {
            this.getLoading().hide();
        },

        padding: function () {
            var t = this.getStatus();
            var st = 0;
            if (t.is(":visible")) {
                st = t.outerHeight();
            }

            return {
                left: this.getObj('left').outerWidth(),
                right: this.getObj('right').outerWidth(),
                bottom: this.getObj('bottom').outerHeight() + st,
                top: this.getObj('top').outerHeight()
            };


        },

        showPosition: function (f) {

            var m = this.I();

            if (m.is(':hidden')) return;

            var v = this.viewport();
            var w = m.outerWidth();
            var h = m.outerHeight();
            var y = v.left + ((v.width - w) / 2);
            var x = v.top + (v.height > h ? ((v.height - h) / 2) : 0);


            var o = this.opts;
            var p = o.position;

            if (f) {

                if (p == 'left' || p == 'right') {
                    m.css({ top: x, left: p == "right" ? (v.left + v.width) : 0 });
                } else {
                    m.css({ top: p == "bottom" ? v.top + v.height : 0, left: y }); // 
                }
                m.stop().animate({ left: y, top: x }, { duration: o.duration, queue: false, easing: o.easing });
            } else {
                m.stop().animate({ top: x }, { duration: o.duration, queue: false, easing: o.easing });
            }


        },

        overlay: function (status) {

            if (status) {

                var o = this.opts;
                $(this.format('<div id="{0}_overlay"></div>', this.Id)).css({
                    position: 'absolute',
                    zIndex: o.zIndex - 1,
                    'background-color': '#333',
                    display: 'none',
                    opacity: 0.3,
                    top: 0,
                    left: 0,
                    width: '100%',
                    height: $(document).height()
                }).appendTo('body').fadeIn();
            } else {
                this.getObj('overlay').fadeOut(300, function () {
                    $(this).remove();
                    if ($.isFunction(o.afterClose)) {
                        o.afterClose.apply(this);
                    }

                });
            }

        },

        minimizeX: function () {

            var o = this.opts;
            var m = this.I();

            if (this.minimized) {

                this.getObj('taskitem').remove();
                var r = m.data('restore');
                m.show();
                this.focus();

                this.move(r.left, r.top, true);
                this.resize(r.width, r.height, true, $.proxy(function () {
                    this.minimized = false;
                    m.removeClass('window-minimized').removeData('restore');

                }, this));



            } else {

                var task = $(this.format('<a class="window-taskbar-item" id="{0}_taskitem" title="{1}"></a>', this.Id, o.title)).css({ width: o.taskbar.width, heigh: o.taskbar.height }).bind('click', $.proxy(function () {

                    this.minimize();

                }, this));

                if (!this.isNullOrEmpty(o.taskbar.icon)) {
                    task.html(this.format('<img src="{0}" />', o.task.icon));
                } else {
                    task.html(o.title);
                }

                $(o.taskbar.dock).append(task);

                var d = m.offset();

                $.extend(d, { width: m.width(), height: m.height() });

                m.data('restore', d);

                var _offset = task.offset();
                this.move(_offset.left, _offset.top, true, $.proxy(function () {
                    this.minimized = true;
                    this.I().hide().addClass('window-minimized').removeClass('window-maximized');
                }, this));

                this.resize(o.taskbar.width, o.taskbar.height, true);
            }

        },

        minimize: function () {

            if ($.isFunction(this.opts.onMin) && !this.minimized) {
                this.opts.onMin.apply(this);
            }


            if (!this.isNullOrEmpty(this.opts.taskbar.dock)) {
                this.minimizeX();
                return;
            }

            var m = this.I();

            if (this.minimized) {
                var r = m.data('restore');
                this.resize(r.width, r.height, true, $.proxy(function () {

                    this.minimized = false;
                    m.removeClass('window-minimized');

                }, this));
            } else {

                m.data('restore', { width: m.width(), height: m.height() });

                var p = this.padding();

                this.resize(m.width(), p.top + p.bottom, true, $.proxy(function () {

                    this.maximized = false;
                    this.minimized = true;
                    m.addClass('window-minimized').removeClass('window-maximized');

                }, this));
            }


        },
        maximize: function () {

            var v = this.viewport();
            var m = this.I();
            var o = this.opts;

            if (this.maximized) {
                var r = m.data('restore');
                this.move(r.left, r.top, true);

                this.resize(r.width, r.height, true, $.proxy(function () {
                    this.maximized = false;
                    m.removeClass('window-maximized').removeData('restore');
                }, this));

            } else {

                var mar = o.margin;
                var h = v.height - mar.top - mar.bottom;
                var w = v.width - mar.left - mar.right;

                var d = m.offset();

                $.extend(d, m.data('restore') || { width: m.width(), height: m.height() });

                m.data('restore', d);

                this.move(v.left + mar.left, v.top + mar.top, true);

                this.resize(w, h, true, $.proxy(function () {
                    this.maximized = true;
                    this.minimized = false;
                    m.addClass('window-maximized').removeClass('window-minimized');
                }, this));

            }

        },



        focus: function () {
            $('.window-container').addClass('window-nofocus').css({ zIndex: this.opts.zIndex - 1 });
            this.I().removeClass('window-nofocus').css({ zIndex: this.opts.zIndex });
        },
        _events: function () {

            var o = this.opts;
            var m = this.I();

            m.bind('mousedown.window', $.proxy(function () {

                this.focus();

            }, this));

            if (o.maximize) {
                this.getMax().show().bind('click', $.proxy(function () {
                    this.maximize();
                }, this));

                this.getObj('top').bind('dblclick.window', $.proxy(function () {
                    this.maximize();
                }, this));
            }

            if (o.minimize) {
                this.getMin().show().bind('click', $.proxy(function () {
                    this.minimize();
                }, this));
            }

            this.getClose().show().bind('click', $.proxy(function () {
                this.close();
            }, this));

            if (o.draggable && $.fn.draggable)
                m.draggable({
                    handle: ".draggable",
                    opacity: 0.5,
                    iframeFix: true,
                    start: $.proxy(function (event, ui) {

                        var r = m.data('restore');
                        if (this.maximized && r) {

                            this.move(r.left, r.top, false);
                            this.resize(r.width, r.height, false, $.proxy(function () {
                                this.maximized = false;
                                m.removeClass('window-maximized');
                            }, this));
                        }


                    }, this)
                });

            if (o.resizable && $.fn.resizable)
                m.resizable({
                    animate: true,
                    zIndex: o.zIndex + 10,
                    maxWidth: o.maxWidth, // gets set once, but doesn't update! WHY?
                    minWidth: o.minWidth,
                    maxHeight: o.maxHeight,
                    minHeight: o.minHeight,

                    resize: $.proxy(function (event, ui) {
                        var s = ui.size;
                        this.setBodySize(s.width, s.height);
                    }, this)
                });

            $(window).unbind("resize." + this.Id).bind("resize." + this.Id, $.proxy(function () {

                if (this.maximized) {
                    this.maximized = false;
                    this.maximize();
                }

            }, this)).unbind('scroll.' + this.Id).bind('scroll.' + this.Id, $.proxy(function () {
                if (!this.closing)
                    this.showPosition();
            }, this))

            .unbind("keydown." + this.Id).bind('keydown.' + this.Id, $.proxy(function (e) {

                switch (e.keyCode) {
                    case 27:
                        this.close();
                        e.preventDefault();
                        break;
                }

            }, this));

        },

        setBodySize: function (w, h, animate) {

            var b = this.getBody().show();
            var _w = !this.undefined(w) ? w : b.outerWidth();
            var _h = !this.undefined(h) ? h : b.outerHeight();

            var p = this.padding();
            w = _w - p.left - p.right;
            h = _h - p.top - p.bottom;
            var o = this.opts;

            this.width = _w;
            this.height = _h;
            if (animate) {
                b.animate({ width: w, height: h }, o.duration, o.easing);
            } else {
                b.css({ width: w, height: h });
            }

        },

        setStatus: function (t) {

            if (!this.isNullOrEmpty(t))
                this.getStatus().html(t).show();

        },

        move: function (x, y, animate, callback) {

            if (animate)
                this.I().animate({ top: y, left: x }, this.opts.duration, this.opts.easing, function () {

                    if ($.isFunction(callback))
                        callback.apply();
                });
            else {

                this.I().css({ top: y, left: x });
                if ($.isFunction(callback))
                    callback.apply();
            }

        },

        resize: function (w, h, animate, callback) {

            var v = this.parseSize(w, h);
            w = v.width;
            h = v.height;

            if (animate)
                this.I().animate({ width: w, height: h }, this.opts.duration, this.opts.easing, function () {
                    if ($.isFunction(callback))
                        callback.apply();
                });
            else {

                this.I().css({ width: w, height: h });

                if ($.isFunction(callback))
                    callback.apply();
            }

            this.setBodySize(w, h, animate);
        },

        restore: function () {
            var m = this.I();
            var r = m.data('restore');
            this.move(r.left, r.top, true);
            this.resize(r.width, r.height, true);

        },

        ajax: function (a) {
            this.showLoading();

            if ($.isFunction(this.opts.onAjax)) {
                this.opts.onAjax.apply(this);
            }

            $.ajax({
                url: a,
                type: "GET",
                cache: false,
                dataType: "html",
                error: function () {
                    alert("The requested content cannot be loaded. Please try again later.");
                },
                success: $.proxy(function (data) {
                    this.hideLoading();
                    var html = $(data).addClass('content-padding');
                    this.showHtml(html);

                    if ($.isFunction(this.opts.afterAjax)) {
                        this.opts.afterAjax.apply(this);
                    }

                }, this)
            });

        },

        showHtml: function (html) {
            this.getContent().html($(html).show()).show();
        },

        iframe: function (url) {
            this.showLoading();
            this.getBody().attr('src', url).load($.proxy(function () {
                this.hideLoading();
            }, this));
        },

        show: function () {

            //  var o = this.options;

            var o = this.opts;

            if ($.isFunction(o.onShow))
                o.onShow.apply(this);

            this.I().show();

            this.showPosition(true);

            if (o.modal) {
                this.overlay(true);
            }

            if ((o.html && o.html.length > 0) || o.type == 'html') {
                this.showHtml(o.html);
            } else if (o.type == 'ajax') {
                this.ajax(o.url);
            } else {
                if (o.url.match(/#/)) {
                    if ($(o.url).length > 0) {
                        var html = $(o.url).clone(true).show().addClass('content-padding');
                        this.showHtml(html);
                    }
                } else {
                    this.iframe(o.url);
                }
            }

            if ($.isFunction(o.afterShow))
                o.afterShow.apply(this);

        },

        init: function () {

            var o = this.opts;
            if ($.isFunction(o.onInit))
                o.onInit.apply(this);

            var id = 'window_' + new Date().getTime();
            $('body').append(this.format(this.tmp, id));
            this.Id = id;
            this.focus();

            this.I().css({
                position: 'absolute',
                opacity: 1.0,
                'z-index': o.zIndex
            }).addClass(o.theme);

            this.getTitle().html(o.title);
            this.setStatus(o.status);
            this.resize(o.width, o.height);
            this._events();

            if ($.isFunction(o.afterInit))
                o.afterInit.apply(this);

            if (o.show)
                this.show();
        },


        close: function () {

            var o = this.opts;
            this.closing = true;
            if ($.isFunction(o.onClose)) {
                o.onClose.apply(this);
            }

            this.I().animate({
                'opacity': 0,
                'top': '-=50'
            }, o.duration, $.proxy(function () {
                this.getContent().empty();
                this.getTitle().empty();
                this.I().hide();
                if (o.modal) {
                    this.overlay(false);
                } else {
                    if ($.isFunction(o.afterClose)) {
                        o.afterClose.apply(this);
                    }
                }

                if (o.destroy) {
                    this.destroy();
                }


            }, this));


        },

        destroy: function () {

            $(window).unbind('.' + this.Id);
            this.I().stop().unbind('.window').removeData('restore').fadeOut(500, function () {
                $(this).remove();
            });
        }
    };

    $.fn.window = function (options) {
        return this.each(function () {
            var x = $(this);
            var o = $.extend(true, {}, options || {}, $.metadata ? x.metadata() : {});
            if (x.is('a')) {
                x.bind('click', function (e) {
                    e.preventDefault();
                    $.extend(o, { url: x.attr('href') });
                    new $.Window(o);
                });
            } else {
                $.extend(o, { type: 'html', html: x });
                new $.Window(o);
            }
        });
    };

})(jQuery);