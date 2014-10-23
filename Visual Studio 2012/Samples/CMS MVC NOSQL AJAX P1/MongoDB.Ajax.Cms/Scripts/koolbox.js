
/*
KoolBox jQuery Plugin 1.0

http://nasa8x.com
http://demo.nasa8x.com/jquery/koolbox-plugin/
Copyright (c) 2011 Nasa8x

Dual licensed under the MIT and GPL licenses:
http://www.opensource.org/licenses/mit-license.php
http://www.gnu.org/licenses/gpl.html
*/


(function ($) {
    $.extend({
        KoolBox: {
            defaults: {

                mode: 'image', //'image', 'html'
                theme: 'window7',
                zIndex: 10000,
                title: '', // window title
                preload: true, // preload image
                autoPlay: false, // auto play width gallery slideshow
                interval: 3000, // 
                width: 470,
                height: 280,
                modal: false, // display overlay
                hideModalClick: 1, // close when click overlay
                duration: 800,
                type: 'html', // ajax, image , iframe
                showPosition: 'top', //'left','right','bottom'
                /*
                controls: {
                alwayDisplay: false,
                width: 'full',
                position: ['center', 'bottom'], //
                padding: 5
                },
                */
                position: {
                    top: 0,
                    left: 0
                },
                overlay: {
                    opacity: 0.5,
                    bg: '#333',
                    duration: {
                        show: 500,
                        hide: 300
                    }
                },
                animation: {
                    duration: 500,
                    queue: false,
                    easing: 'easeInOutBack'// 'swing'
                },
                buttons: {
                    ok: 'OK',
                    cancel: 'Cancel'
                },
                showCallback: null,
                hideCallback: null

            },

            flash: {
                width: 640,
                height: 510,
                flashvars: {
                    autoplay: 1,
                    autostart: 1,
                    fullscreenbutton: 1,
                    fullscreen: 1
                },
                tmp: '<embed src="{0}" width="{1}" height="{2}" flashvars="{3}" type="{4}" allowscriptaccess="always" allowfullscreen="true" autostart="true" autoplay="true" wmode="transparent"></embed>'
            },
            keyboard:
            {
                LEFT: 37,
                DOWN: 40,
                RIGHT: 39,
                UP: 38,
                ENTER: 13,
                ESCAPE: 27
            },
            tmp: '<div id="{0}" class="koolbox-container">\
                            <table cellpadding="0" cellspacing="0" width="100%">\
                                <tr>\
                                    <td class="box-t-l"/><td class="box-t-c" /><td class="box-t-r"/>\
                                </tr>\
                                <tr>\
                                    <td class="box-m-l"/>\
                                    <td class="box-m-c"> \
                                        <div id="{0}_body" class="body">\
                                            <div id="{0}_title" class="title"></div>\
                                            <div id="{0}_loading" class="loading"></div>\
                                            <a id="{0}_close" href="javascript:void(0)" class="close"><span></span></a>\
                                            <div id="{0}_content" class="content"></div>\
                                            <div id="{0}_desc" class="desc"></div>\
                                            <div id="{0}_controls" class="controls">\
                                                    <a href="javascript:void(0)" class="left"><span></span></a>\
                                                    <a href="javascript:void(0)" id="{0}_prev" class="prev"><span></span></a>\
                                                    <a href="javascript:void(0)" id="{0}_play" class="play"><span></span></a>\
                                                    <a href="javascript:void(0)" id="{0}_next" class="next"><span></span></a>\
                                                    <a href="javascript:void(0)" class="right"><span></span></a>\
                                            </div>\
                                            <div class="foot" id="{0}_foot"></div>\
                                        </div>\
                                     </td>\
                                     <td class="box-m-r" />\
                                </tr>\
                                <tr>\
                                <td class="box-b-l"/><td class="box-b-c"/><td class="box-b-r"/>\
                                </tr>\
                        </table>\
                  </div>'
            ,
            GL: {
                i: 0,
                descs: [],
                imgs: []
            },
            Id: null,
            options: {},
            animation: null,
            timer: null,
            medias: {
                swf: {
                    reg: /[^\.]\.(swf)\b/i
                },
                youtube: {
                    reg: /youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)[&\w;=\+_\-]*/,
                    url: "http://www.youtube.com/v/{0}",
                    flashvars: {
                        fs: 1
                    }
                },
                vimeo: {
                    flashvars: {
                        server: 'vimeo.com',
                        title: 1,
                        portrait: 0,
                        byline: 1
                    },
                    reg: /vimeo.com\/(\d+)($|\/|\b)/i,
                    url: "http://vimeo.com/moogaloop.swf?clip_id={0}"

                },

                megavideo: {
                    flashvars: {
                        autoplay: true
                    },
                    reg: /megavideo\.com\/\?v=([A-Za-z0-9._%-]*)[&\w;=\+_\-]*/i,
                    url: "http://www.megavideo.com/v/{0}"
                },

                facebook: {

                    reg: /facebook.com\/video\/video\.php\?v=(\d+)($|s+|\/)/i,
                    url: 'http://www.facebook.com/v/{0}'
                },

                metacafe: {
                    flashvars: {
                        autoplay: 'yes'
                    },
                    reg: /metacafe\.com\/watch\/(\d+)($|\/)/i,
                    url: "http://www.metacafe.com/fplayer/{0}/player.swf"
                },
                dailymotion: {
                    flashvars: {
                        additionalInfos: 0
                    },
                    reg: /dailymotion.com\/video\/([A-Za-z0-9._%-]*)($|\/)/i,
                    url: "http://www.dailymotion.com/swf/video/{0}"
                },

                clipvn: {
                    reg: /clip.vn\/watch\/[a-zA-Z0-9_%-]+,([A-Za-z0-9._%-]*)($|\/)/i,
                    url: 'http://clip.vn/w/{0}'
                },

                veoh: {
                    flashvars: {
                        version: 'AFrontend.5.7.0.1060',
                        player: 'videodetailsembedded',
                        videoAutoPlay: 1
                    },
                    reg: /veoh\.com\/watch\/([A-Za-z0-9._%-]*)($|\/)/i,
                    url: "http://www.veoh.com/swf/webplayer/WebPlayer.swf?permalinkId={0}&id=anonymous"
                },

                quicktime: {
                    reg: /\b.mov\b/i,
                    type: 'video/quicktime'
                }

            },

            maps: {

                google: {
                    reg: /maps.google.com\/maps\/?(.*)/i,
                    url: "http://maps.google.com/?output=embed&amp;{0}"
                }
            },

            undefined: function () {
                for (var i = 0; i < arguments.length; i++)
                    if (typeof arguments[i] != 'undefined') return false;
                return true;
            },

            isImage: function (src) {
                var reg = /[^\.]\.(jpg|jpeg|gif|png|bmp|tiff)\b/i;
                //  var reg = /(?i)\.(jpg|jpeg|gif|png|bmp|tiff)$/i;
                if (src.match(reg))
                    return true;
                else
                    return false;
            },
            getDocHeight: function () {

                var b = document.body,
                e = document.documentElement,
                w = 0,
                h = 0;
                if (e) {
                    //w = Math.max(w, e.scrollWidth, e.offsetWidth);
                    h = Math.max(h, e.scrollHeight, e.offsetHeight);
                }
                if (b) {
                    // w = Math.max(w, b.scrollWidth, b.offsetWidth);
                    h = Math.max(h, b.scrollHeight, b.offsetHeight);
                    if (window.innerWidth) {
                        //  w = Math.max(w, window.innerWidth);
                        h = Math.max(h, window.innerHeight);
                    }
                }
                return h; // [w, h];

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


            preloadImages: function (a) {
                $.each(a, function (key, value) {
                    var i = new Image();
                    i.src = value;
                });

            },

            viewport: function () {
                return $.extend({
                    height: $(window).height(),
                    width: $(window).width(),
                    top: $(window).scrollTop(),
                    left: $(window).scrollLeft()
                });

            },

            objectToArgs: function (o) {
                var type = typeof (o);
                var a = [];
                if (type == "object") {
                    for (var key in o) {
                        if (typeof (o[key]) == "object") {
                            this.objectToArgs(o[key]);
                        }
                        else {
                            a.push(key + '=' + encodeURIComponent(o[key]));
                        }

                    }
                    return a.join('&');
                }
                return '';
            },

            queryStringToObject: function (url) {
                var o = {};
                if (url.indexOf('?') >= 0) {
                    var qs = url.split('?')[1];

                    var pairs = qs.split('&');
                    $.each(pairs, function (i, v) {
                        var pair = v.split('=');
                        o[pair[0]] = pair[1];
                    });
                }
                return o;

            },

            getObj: function () {
                return $(this.format('#{0}', this.Id));
            },

            I: function () {
                return this.getObj();
            },
            getId: function () {
                $(this.format('#{0}', this.Id));
            },
            getDesc: function () {
                return $(this.format('#{0}_desc', this.Id));
            },
            getTitle: function () {
                return $(this.format('#{0}_title', this.Id));
            },
            getBody: function () {
                return $(this.format('#{0}_body', this.Id));
            },

            getContent: function () {
                return $(this.format('#{0}_content', this.Id));
            },
            getClose: function () {
                return $(this.format('#{0}_close', this.Id));
            },

            getPlay: function () {
                return $(this.format('#{0}_play', this.Id));
            },

            getNext: function () {
                return $(this.format('#{0}_next', this.Id));
            },

            getPrev: function () {
                return $(this.format('#{0}_prev', this.Id));
            },

            getOk: function () {
                return $(this.format('#{0}_ok', this.Id));
            },

            getPrompt: function () {
                return $(this.format('#{0}_prompt', this.Id));
            },
            getFoot: function () {
                return $(this.format('#{0}_foot', this.Id));
            },

            getControls: function () {
                return $(this.format('#{0}_controls', this.Id));
            },

            getLoading: function () {
                return $(this.format('#{0}_loading', this.Id));
            },

            Overlay: {
                defaults: {
                    bg: '#333333',
                    opacity: 0.3,
                    width: '100%',
                    click: null,
                    duration: {
                        show: 500,
                        hide: 300
                    }
                },
                options: {},
                getId: function () {
                    return $($.KoolBox.format("#overlay_{0}", this.Id));
                },

                create: function (s) {
                    s = $.extend(this.options, this.defaults, s || {});
                    this.Id = new Date().getTime();
                    var o = $($.KoolBox.format('<div id="overlay_{0}"></div>', this.Id));
                    $('body').append(o);
                    o.css({
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        background: s.bg,
                        opacity: s.opacity,
                        zIndex: s.zIndex,
                        width: s.width,
                        height: $.KoolBox.getDocHeight()
                    }).hide().fadeIn(s.duration.show);

                    if ($.isFunction(s.click)) {
                        o.bind('click', function () {
                            s.click.apply();
                        });
                    }

                },
                show: function (s) {

                    if (this.Id) {
                        this.getId().fadeIn(this.options.duration.show);
                    }
                    else {
                        this.create(s);
                    }

                },
                hide: function (callback) {
                    this.getId().fadeOut(this.options.duration.hide, function () {
                        if ($.isFunction(callback)) {
                            callback.apply();
                        }
                    });
                }
            },

            showLoading: function () {

                this.loading = true;
                var l = this.getLoading();
                var w = l.outerWidth();
                var h = l.outerHeight();
                var y = ((this.width - w) / 2);
                var x = ((this.height - h) / 2);
                l.css({ top: x, left: y }).show();

            },

            hideLoading: function () {

                this.loading = false;
                this.getLoading().hide();
            },

            /*
            showControls: function () {
            var c = this.options.controls;
            var pos = c.position;
            var p = c.position.padding;
            var e = this.getControls();
            var w = c.width == 'full' ? this.width : 'auto';
            var t = 0, l = 0;

            if (pos.constructor != Array) {
            pos = ['center', 'bottom'];
            }
            if (pos[0].constructor == Number) {
            l = pos[0];
            } else {
            switch (pos[0]) {
            case 'left':
            l = p;
            break;
            case 'right':
            l = c.width == 'full' ? 0 : this.width - e.outerWidth();
            break;
            default:
            case 'center':
            l = c.width == 'full' ? 0 : (this.width - e.outerWidth()) / 2;
            break;
            }
            }
            if (pos[1].constructor == Number) {
            t = pos[1];
            } else {
            switch (pos[1]) {
            case 'top':
            t = p;
            break;
            case 'bottom':
            t = (this.height - e.outerHeight());
            break;
            default:
            case 'center':
            t = (this.height - e.outerHeight()) / 2;
            break;
            }
            }

            e.css({ left: l, top: t, width: w }).fadeIn('fast');

            },
            */

            showPosition: function (f) {

                if (!this.visibled) return;

                var v = this.viewport();
                var m = this.I();
                //var h = !this.undefined(height) ? height : m.outerHeight();
                //var w = !this.undefined(width) ? width : m.outerWidth();
                var w = m.outerWidth();
                var h = m.outerHeight();
                var y = v.left + ((v.width - w) / 2);
                var x = v.top + ((v.height - h) / 2);
                var a = this.options.animation;
                var p = this.options.position;

                if (f) {

                    if (p == 'left' || p == 'right') {
                        m.css({ top: x, left: p == "right" ? (v.left + v.width) : 0 });
                    }
                    else {
                        m.css({ top: p == "bottom" ? v.top + v.height : 0, left: y }); // 
                    }
                    // m.css({ top: p.top, left: p.left, width: 0, height: 0 }); // 
                }

                if (this.animation) {
                    this.animation.stop();
                }

                this.animation = m.animate({
                    left: y,
                    top: x
                }, {

                    duration: a.duration,
                    queue: a.queue
                    , easing: a.easing
                });

            },



            close: function (args) {

                this.visibled = false;

                this.I().animate({
                    'opacity': 0,
                    'top': '-=50'
                }, this.options.animation.duration, $.proxy(function () {
                    if (this.options.modal) {
                        this.Overlay.hide();
                    }
                    this.getContent().empty();
                    this.getTitle().empty();
                    this.getObj().hide();
                    this.stop();
                    if ($.isFunction(this.options.closeCallback) && args != undefined) {
                        this.options.closeCallback.apply(window, $.makeArray(args));
                    }

                }, this));


            },

            addEvents: function () {
                $(window).unbind("resize.koolbox scroll.koolbox").bind("resize.koolbox scroll.koolbox", $.proxy(function () {
                    this.showPosition();
                }, this));

                $(window).unbind("keydown.koolbox").bind('keydown.koolbox', $.proxy(function (e) {

                    if (this.visibled) {
                        var k = this.keyboard;
                        switch (e.keyCode) {
                            case k.ESCAPE:
                                this.close();
                                e.preventDefault();
                                break;
                            case k.LEFT:
                            case k.UP:
                                if (this.GL.total > 1)
                                    this.prev();
                                break;
                            case k.RIGHT:
                            case k.DOWN:
                                if (this.GL.total > 1)
                                    this.next();
                                break;
                            case k.ENTER:
                                if ((this.options.type == 'alert' || this.options.type == 'prompt') && !(/option|textarea|select/i.test(e.target.nodeName) || e.target.type === "text")) {
                                    this.getOk().trigger('click');
                                    e.preventDefault();
                                }

                                break;

                        }

                    }


                }, this));


                this.getClose().unbind("click.koolbox").bind("click.koolbox", $.proxy(this.close, this));

                /*
                if (!this.options.controls.alwayDisplay) {
                this.getBody().hover(
                $.proxy(function () {
                //this.getControls().addClass('controls-over');
                this.showControls();
                }, this),
                $.proxy(function () {
                this.getControls().hide();
                }, this)
                );
                }

                */

                this.getNext().unbind("click.koolbox").bind('click.koolbox', $.proxy(this.next, this));

                this.getPrev().unbind("click.koolbox").bind('click.koolbox', $.proxy(this.prev, this));

                this.getPlay().unbind('click.koolbox').bind('click.koolbox', $.proxy(function () {
                    if (this.timer == null) {
                        this.play();
                    }
                    else {
                        this.stop();
                    }
                }, this));


                if ($.isFunction(this.options.showCallback)) { this.options.showCallback.apply(); }


            },

            switchMode: function (s) {
                if (!this.isNullOrEmpty(s) && s != this.mode) {
                    s = 'mode-' + s;
                    var i = this.getBody();
                    if (!this.isNullOrEmpty(this.mode)) {
                        i.removeClass(this.mode);
                    }
                    i.addClass(s);
                    this.mode = s;
                }

            },

            switchTheme: function (s) {
                if (!this.isNullOrEmpty(s) && s != this.theme) {
                    s = 'koolbox-' + s;
                    var i = this.I();
                    if (!this.isNullOrEmpty(this.theme)) {
                        i.removeClass(this.theme);
                    }
                    i.addClass(s);
                    this.theme = s;
                }
            },

            parseSize: function (width, height) {

                var W = $(window).width() * 0.9;
                var H = $(window).height() * 0.9;
                if (width > W) {
                    height = height * (W / width);
                    width = W;
                    if (height > H) {
                        width = width * (H / height);
                        height = H;
                    }
                } else if (height > H) {
                    width = width * (H / height);
                    height = H;
                    if (width > W) {
                        height = height * (W / width);
                        width = W;
                    }
                }
                return { width: parseInt(width), height: parseInt(height) };

            },



            resize: function (w, h) {

                var b = this.getBody();
                var _w = !this.undefined(w) ? w : b.outerWidth();
                var _h = !this.undefined(h) ? h : b.outerHeight();
                this.width = _w;
                this.height = _h;
                b.css({ width: _w, height: _h });
                this.showPosition();

            },

            create: function () {

                var o = this.options;

                if (this.Id == null) {
                    this.Id = 'koolbox_' + new Date().getTime();
                    $('body').append(this.format(this.tmp, this.Id));

                }

                if (o.modal) {
                    var ol = $.extend({}, o.overlay, { zIndex: o.zIndex - 1, click: o.hideModalClick ? $.proxy(this.close, this) : null });
                    this.Overlay.show(ol);
                };

                this.I().css({
                    position: 'absolute',
                    opacity: 1.0,
                    'z-index': o.zIndex
                }).show();

                if (!this.isNullOrEmpty(o.title)) {
                    this.getTitle().html(o.title).show();
                } else {
                    this.getTitle().hide();
                }
                this.resize(o.width, o.height);
                this.getControls().hide();
                this.getDesc().hide();
                this.getFoot().hide();
                this.switchTheme(o.theme);
                this.switchMode(o.mode);
                this.addEvents();
                this.visibled = true;


                //this.getOk().focus();
            },

            getDescription: function (x) {

                if (!this.undefined(this.GL.descs) && this.GL.descs.length > x) {
                    return this.GL.descs[x];
                }
                return '';
            },

            shake: function () {
                var m = this.I();
                for (var i = 0; i < 2; i++) {
                    m.animate({ left: "+=20" }, 100);
                    m.animate({ left: "-=20" }, 100);
                };

            },
            show: function (a, c, d, u) {
                var q = this.queryStringToObject(a);
                $.extend(c, q || {});
                var o = $.extend({}, this.defaults, c || {});
                this.options = o;
                this.create();
                this.showPosition(true);
                this.loading = false;
                var html;
                this.GL.imgs = [];
                this.GL.total = 0;
                if ($.isArray(a) && a.length > 1) {
                    var index = !this.undefined(u) ? $.inArray(u, a) : 0;
                    this.GL.i = index;
                    this.GL.imgs = a;
                    this.GL.descs = d;
                    this.GL.total = a.length;
                    this.getControls().show();
                    this.showImg(a[index], this.getDescription(index));

                    if (o.preload) {
                        this.preloadImages(a);
                    }

                    if (o.autoPlay) {
                        this.play();
                    }

                }
                else if (this.isImage(a)) {
                    this.showImg(a, d);
                }
                else if (o.type == 'iframe') {
                    html = this.format('<iframe id="{0}_iframe" src="{1}" width="{2}" height="{3}" frameborder="0"></iframe>', this.Id, a, o.width, o.height);
                    this.showHtml(html);
                }
                else if (o.type == 'ajax') {
                    this.ajax(a);
                }
                else {

                    var b = false;
                    $.each(this.medias, $.proxy(function (i, v) {
                        var match = a.match(v.reg);
                        if (match) {
                            var url = !this.undefined(v.url) ? this.format(v.url, match[1]) : a;
                            var t = !this.undefined(v.type) ? v.type : 'application/x-shockwave-flash';
                            this.embed(url, c.width, c.height, v.flashvars, t);
                            b = true;
                            return;
                        }
                    }, this));

                    if (!b) {
                        $.each(this.maps, $.proxy(function (i, v) {
                            var match = a.match(v.reg);
                            if (match) {
                                var url = this.format(v.url, match[1]);
                                html = this.format('<iframe id="{0}_iframe" src="{1}" width="{2}" height="{3}" frameborder="0"></iframe>', this.Id, url, o.width, o.height);
                                this.showHtml(html);
                                b = true;
                                return;
                            }
                        }, this));

                    }

                    if (!b) {

                        if (a.match(/#/)) {
                            var e = a.substr(a.indexOf("#"));
                            if ($(e).length > 0) {
                                html = $(a).clone(true).show().addClass('content-padding');
                                this.showHtml(html);
                            }
                        } else {
                            this.ajax(a);
                        }
                    }


                }

            },


            next: function () {

                //if (this.GL.total <= 1) return;
                if (this.loading) return;
                var x = this.GL.i;
                if (x + 1 >= this.GL.total) {
                    x = 0;
                } else {
                    x = x + 1;
                }
                this.GL.i = x;
                this.showImg(this.GL.imgs[x], this.getDescription(x));
            },

            prev: function () {
                var x = this.GL.i;
                if (x - 1 < 0) {
                    x = this.GL.total - 1;
                } else {
                    x = x - 1;
                }
                this.GL.i = x;
                this.showImg(this.GL.imgs[x], this.getDescription(x));
            },

            play: function () {

                this.getPlay().removeClass('play').addClass('stop');
                this.timer = window.setInterval($.proxy(this.next, this), this.options.interval);

            },
            stop: function () {
                this.getPlay().removeClass('stop').addClass('play');
                window.clearInterval(this.timer);
                this.timer = null;
            },

            embed: function (src, w, h, fvars, t) {
                var f = this.flash;
                var flashvars = $.extend({}, this.flash.flashvars, fvars || {});
                var width = !this.undefined(w) ? w : f.width;
                var height = !this.undefined(h) ? h : f.height;
                var v = this.objectToArgs(flashvars);
                var html = this.format(f.tmp, src, width, height, v, t);
                this.resize(width, height);
                this.showHtml(html);
            },

            ajax: function (a) {
                this.showLoading();
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
                    }, this)

                });

            },

            showHtml: function (html) {
                this.switchMode('html');
                this.getContent().html(html).show();
                this.showPosition();
            },

            showImg: function (i, d) {

                this.switchMode('image');
                this.showLoading();
                var img = new Image();
                img.src = i;
                $(img).load($.proxy(function () {
                    this.hideLoading();

                    var s = this.parseSize(img.width, img.height);
                    //this.size(s.width, s.height);
                    this.resize(s.width, s.height);
                    $(img).hide();
                    this.getContent().html(img).show();
                    $(img).css({ width: s.width, height: s.height }).fadeIn(this.options.duration);

                    if (!this.undefined(d) && d.length > 0) {
                        this.getDesc().empty().html(d).show();
                    }
                    else {
                        this.getDesc().hide();
                    }

                    //                    if (this.options.controls.alwayDisplay) {
                    //                        this.showControls();
                    //                    }

                }, this));
            },

            msg: function (m, o) {
                o = $.extend({}, this.defaults, { width: 400, height: 'auto' }, o || {});
                this.options = o;
                this.create();
                this.switchMode('message');
                var c = this.getContent();
                c.addClass(o.type).html(m).show();
                var b = $('<div class="button-wrapper" />');
                if (o.type == 'alert' || o.type == 'confirm') {
                    b.append($(this.format('<input type="button" value="{0}" id="{1}_ok" />', o.buttons.ok, this.Id)).bind('click', $.proxy(function (e) { this.close(true); }, this)));

                    if (o.type == 'confirm') {
                        b.append($(this.format('<input type="button" value="{0}" id="{1}_cancel" />', o.buttons.cancel, this.Id)).bind('click', $.proxy(function (e) { this.close(false); }, this)));
                    }
                }
                else if (o.type == "prompt") {

                    var prompt = $(this.format('<input type="text" id="{0}_prompt" />', this.Id)).bind('keydown', $.proxy(function (e) {
                        var val = prompt.val();
                        if (e.keyCode == 13 && val.length > 0) {
                            this.close(val);
                        }

                    }, this));

                    var btnOk = $(this.format('<input type="button" value="{0}" id="{1}_ok" />', o.buttons.ok, this.Id)).bind('click', $.proxy(function (e) {
                        if (prompt.val().length <= 0) {
                            prompt.focus();
                            this.shake();
                        }
                        else {
                            this.close(prompt.val());
                        }
                        e.preventDefault();
                    }, this));


                    c.append(prompt);

                    b.append(btnOk).append($(this.format('<input type="button" value="{0}" id="{1}_cancel" />', o.buttons.cancel, this.Id)).bind('click', $.proxy(function (e) { this.close(); }, this)));
                }
                this.getFoot().html(b).show();
                this.showPosition(true);
            },

            alert: function (msg, options, callback) {
                var o = $.extend({}, { type: 'alert', closeCallback: callback }, options || {});
                this.msg(msg, o);
            },

            confirm: function (msg, options, callback) {
                var o = $.extend({}, { type: 'confirm', closeCallback: callback }, options || {});
                this.msg(msg, o);
            },

            prompt: function (msg, options, callback) {
                var o = $.extend({}, { type: 'prompt', closeCallback: callback }, options || {});
                this.msg(msg, o);
            }

        }



    });


    $.fn.koolbox = function (options) {
        return $(this).bind('click', function (e) {
            var m = $(this);
            e.preventDefault();
            $(this).blur();
            var u = m.attr('href');
            var p = m.offset();
            var a = [];
            var d = [];
            var r = $.trim(m.attr('rel')) || '';
            var t = $.trim(m.attr('title')) || '';

            if (!r || r == '' || r === 'nofollow') {
                a.push(u);
                if (t && t != '') {
                    d.push(t);
                }
            }
            else {

                $("a[rel=" + r + "], area[rel=" + r + "]").each(function () {
                    a.push($(this).attr('href'));
                    d.push($(this).attr('title'));

                });
            }

            if (a.length == 1) a = a[0];
            if (d.length == 1) d = d[0];
            var o = $.extend({}, options || {}, $.metadata ? m.metadata() : $.meta ? m.data() : {});
            //            if (o) {
            //                o.position = p;
            //            }
            $.KoolBox.show(a, o, d, u);
        });
    };

})(jQuery);