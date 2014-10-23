


(function ($) {

    $.extend({

        undefined: function () {
            for (var i = 0; i < arguments.length; i++)
                if (typeof arguments[i] != 'undefined') return false;
            return true;
        },

        viewport: function () {
            var d = document.documentElement, b = document.body, w = window;
            return jQuery.extend(
                    jQuery.browser.msie ?
                        { left: b.scrollLeft || d.scrollLeft, top: b.scrollTop || d.scrollTop } :
                        { left: w.pageXOffset, top: w.pageYOffset },
                    !$.undefined(w.innerWidth) ?
                        { width: w.innerWidth, height: w.innerHeight } :
                        (!$.undefined(d) && !$.undefined(d.clientWidth) && d.clientWidth != 0 ?
                            { width: d.clientWidth, height: d.clientHeight } :
                            { width: b.clientWidth, height: b.clientHeight }));
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

        queryString: function (key) {
            key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regex = new RegExp("[\\?&]" + key + "=([^&#]*)", 'ig');
            var qs = regex.exec(window.location.href);
            if (qs == null)
                return null;
            else
                return qs[1];

        },
        bookmark: function (title, url) {
            if (window.sidebar) { // Mozilla Firefox Bookmark
                window.sidebar.addPanel(title, url, "");
            } else if (window.external) { // IE Favorite
                window.external.AddFavorite(url, title);
            } else if (window.opera) { // Opera 7+
                return false; // do nothing
            } else {
                alert('Unfortunately, this browser does not support the requested action, please bookmark this page manually.');

            }
            return false;
        },

        showDialog: function (url, opts) {

            var winH = $(window).height();
            var winW = $(window).width();
            var w = opts && opts.width > 0 ? opts.width : winW * 0.8;
            var h = opts && opts.height > 0 ? opts.height : winH * 0.8;
            var winX = (winW - w) * .5;
            var winY = (winH - h) * .5;
            window.showModalDialog(url, opts, 'dialogWidth:' + w + ',dialogHeight:' + h + ',center:1,modal:1;dialogTop:' + winY + ';dialogLeft:' + winX);
        },

        toggleCheckbox: function (_state, _forClass) {

            // default
            var _class = 'input[type=checkbox].selected';

            if (_forClass) _class = _forClass;

            $(_class).each(function () {
                $(this).attr("checked", _state);
            });

        },
        getItemsSelected: function (_forClass) {
            var _items = new Array();
            var _class = 'input[type=checkbox].selected:checked';
            if (_forClass) _class = _forClass;
            $(_class).each(function () {

                _items.push($(this).val());

            });
            return _items;

        },

        scrollTo: function (target, duration) {
            if ($(target))
                $('html,body').animate({ scrollTop: $(target).offset().top }, duration ? duration : 500);
        },
        
        jump:function (url) {
            if (url.length > 0) {
                window.location = url;
            }
        },

        Html: {
            encode: function (html) {
                html = html.replace(/&quot;/g, '&quotx;');
                html = html.replace(/"/g, '&quot;');
                html = html.replace(/&amp;/g, '&ampx;');
                html = html.replace(/&/g, '&amp;');
                html = html.replace(/&lt;/g, '&ltx;');
                html = html.replace(/</g, '&lt;');
                html = html.replace(/&gt;/g, '&gtx;');
                html = html.replace(/>/g, '&gt;');
                return html;
            },
            democde: function (html) {
                html = html.replace(/&gt;/g, '>');
                html = html.replace(/&gtx;/g, '&gt;');
                html = html.replace(/&lt;/g, '<');
                html = html.replace(/&ltx;/g, '&lt;');
                html = html.replace(/&amp;/g, '&');
                html = html.replace(/&ampx;/g, '&amp;');
                html = html.replace(/&quot;/g, '"');
                html = html.replace(/&quotx;/g, '&quot;');
                return html;
            }
        },

        String: {
            trim: function () {
                return this.replace(/^\s+|\s+$/g, '');
            },

            //if( $.StringEx.isNullOrEmpty('') ) alert('Empty string');
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

            replace: function (source, oldVal, newVal) {
                var result = source;
                result = result.replace(new RegExp('\\' + oldVal + '\\', 'g'), newVal);
                return result;
            },

            format: function (format) {
                var result = format;
                for (var i = 1; i < arguments.length; i++) {
                    result = result.replace(new RegExp('\\{' + (i - 1) + '\\}', 'g'), arguments[i]);
                }
                return result;
            },
            startsWith: function (str, prefix) {
                return str.indexOf(prefix) === 0;

            },
            endsWith: function (str, suffix) {
                /*if (!suffix) return false;
                    if (suffix.length > this.length) return false;
                    if (ignoreCase) {
                        if (ignoreCase == true) {
                            return (this.substr(this.length - suffix.length).toUpperCase() == suffix.toUpperCase());
                        }
                    }
                    return (this.substr(this.length - suffix.length) === suffix);*/

                return str.match(suffix + "$") == suffix;


            }
        },
        Overlay: {
            defaults: {
                bg: '#333333',
                opacity: 0.3,
                width: '100%',
                showDuration: 500,
                hideDuration: 300
            },
            options: {},
            getId: function () {
                return $($.String.format("#overlay_{0}", this.Id));
            },
            create: function (s) {

                this.options = s = $.extend({}, this.defaults, s || {});

                this.Id = new Date().getTime();
                var o = $($.String.format('<div id="overlay_{0}"></div>', this.Id));
                $('body').append(o);
                o.css({
                    position: 'absolute',
                    top: 0,
                    left: 0,
                    background: s.bg,
                    opacity: s.opacity,
                    zIndex: s.zIndex,
                    width: s.width,
                    height: $.getDocHeight()//$(document).outerHeight()
                }).hide().fadeIn(s.showDuration);

                //this.created = true;
            },
            show: function (s) {

                if (this.Id) {
                    this.getId().fadeIn(this.options.showDuration);
                }
                else {
                    this.create(s);
                }

            },
            hide: function () {
                this.getId().fadeOut(this.options.hideDuration);
            }
        },
        Loading: {
            visibled: false,
            defaults: {
                theme: '',
                modal: 1,
                zIndex: 99999,
                position: ['center', 'center'], // ['center','top','right','bottom','left']
                margin: 10
            },

            getId: function () {
                return $($.String.format("#loading_{0}", this.Id));
            },
            showPosition: function () {

                if (!this.visibled) return;

                var s = this.options;
                var e = this.getId();
                var v = $.viewport();
                var h = e.outerHeight();
                var w = e.outerWidth();

                var t = 0, l = 0;

                switch (s.position[0]) {

                    default:
                    case 'center':
                        l = v.left + ((v.width - w) / 2);
                        t = v.top + ((v.height - h) / 2);
                        break;
                    case 'top-left':
                        t = v.top + s.margin;
                        l = v.left + s.margin;
                        break;
                    case 'top-right':
                        t = v.top + s.margin;
                        l = v.left + v.width - w - s.margin * 2;
                        break;

                    case 'bottom-left':
                        t = v.top + v.height - h - s.margin;
                        l = v.left + s.margin;
                        break;
                    case 'bottom-right':
                        t = v.top + v.height - h - s.margin;
                        l = v.left + v.width - w - s.margin * 2;
                        break;

                }
                if (this.animating) {
                    this.animating.stop();
                }
                e.show();
                this.animating = e.animate({ top: t, left: l }, {
                    duration: this.options.showDuration,
                    queue: false
                });

            },
            setEvents: function () {
                $(window).bind('resize scroll', $.proxy(function () {

                    this.showPosition();

                }, this));

                $(window).bind('keydown', $.proxy(function (e) {
                    if (e.keyCode == 27) {
                        this.hide();
                        e.preventDefault();
                    }
                }, this));
            },
            create: function (s) {

                this.Id = new Date().getTime();

                var e = $($.String.format('<div id="loading_{0}" class="loading {1}"></div>', this.Id, s.theme));

                $('body').append(e);
                e.css({ position: 'absolute', zIndex: s.zIndex });

                this.showPosition();
                this.setEvents();

                //this.created = true;
            },

            show: function (s, o) {


                this.options = s = $.extend({}, this.defaults, s || {});
                if (this.options.modal) {
                    o = $.extend(true, { zIndex: s.zIndex - 1 }, o || {});
                    $.Overlay.show(o);
                }
                this.visibled = true;
                if (this.Id) {
                    this.showPosition();
                }
                else {

                    this.create(s);
                }

            },
            hide: function () {
                if (this.options.modal) {
                    $.Overlay.hide();
                }
                this.getId().hide();
                this.visibled = false;
            }
        },

        Ajax: {
            defaults: {
                target: null,
                loading: true,
                data: null,
                resultMode: null,
                hashPwd: null,
                onRequest: null,
                onComplete: null,
                onError: null,
                method: 'POST',
                dataType: 'html'
            },

            submit: function (f, options) {

                var _f = (typeof f == 'object') ? f : $('#' + f);

                var _s = $.extend({}, this.defaults, options || {}, $.metadata ? _f.metadata({ type: 'attr', name: 'data-ajax' }) : {});

                if (window.tinymce && _f.find('.tinymce')) {
                    window.tinyMCE.triggerSave();
                };

                /* if ($.validator && $.validator.unobtrusive)
                $.validator.unobtrusive.parse(_f);*/

                //, invalidHandler: function () { _f.find(":input.error:first").focus(); }
                _f.validate({ meta: 'validate' });

                if (_f.valid()) {

                    if (_s.loading && $.Loading) {
                        $.Loading.show();
                    };

                    if (_s.hashPwd && $.Hash) {
                        _f.find(":password").each(function () {
                            var _v = $(this).val();
                            if (_v.length > 0)
                                $(this).val($.Hash.sha256(_v));
                        });
                    };

                    _f.find(":checkbox").each(function () {
                        if (!$(this).attr('value'))
                            $(this).val($(this).is(":checked"));
                    });

                    if ($.isFunction(_s.onRequest)) {
                        _s.onRequest.apply();
                    }

                    $.ajax({
                        type: _s.method,
                        url: _f.attr("action"),
                        data: _f.serialize(),
                        cache: false,
                        statusCode: {
                            404: function () {
                                alert('page not found');
                            }
                        },
                        success: function (data) {
                            if ((_s.dataType == 'html' || _s.dataType == 'text') && _s.target) {

                                switch (_s.resultMode) {
                                    case 'append':
                                        $(_s.target).append(data);
                                        break;
                                    case 'prepend':
                                        $(_s.target).prepend(data);
                                        break;
                                    case 'replacewith':
                                        $(_s.target).replaceWith(data);
                                        break;
                                    case 'after':
                                        $(data).after($(_s.target));
                                        break;
                                    case 'before':
                                        $(data).before($(_s.target));
                                        break;
                                    default:
                                        $(_s.target).html(data);
                                        break;
                                }


                            }
                            if (_s.onComplete) {
                                if ($.isFunction(_s.onComplete))
                                    _s.onComplete.apply(data);
                                   // _s.onComplete.call(this, data);
                                else
                                    eval(_s.onComplete);
                            }

                            if (_s.hashPwd) {
                                _f.find("input:password").val('');
                            }

                            if (_s.loading && $.Loading) {
                                $.Loading.hide();
                            }
                        }
                    })
                .error(function (xhr, ajaxOptions, thrownError) {
                    if (_s.onError) {
                        if ($.isFunction(_s.onError))
                            _s.onError.call(this, xhr, ajaxOptions, thrownError);
                        else
                            eval(_s.onError);
                    }

                    else {
                        alert('Error:' + xhr.status + '\n' + thrownError);
                    }

                    if (_s.loading && $.Loading) {
                        $.Loading.hide();
                    }

                });


                } // end validate

            },

            load: function (u, o) {

                var _s = $.extend({}, this.defaults, o || {});

                if (_s.loading && $.Loading) {
                    $.Loading.show();
                };

                $.ajax({

                    type: 'GET',
                    url: u,
                    data:_s.data,
                    success: function (data) {
                        if ((_s.dataType == 'html' || _s.dataType == 'text') && _s.target) {

                            switch (_s.resultMode) {
                                case 'append':
                                    $(_s.target).append(data);
                                    break;
                                case 'prepend':
                                    $(_s.target).prepend(data);
                                    break;
                                case 'replacewith':
                                    $(_s.target).replaceWith(data);
                                    break;
                                case 'after':
                                    $(data).after($(_s.target));
                                    break;
                                case 'before':
                                    $(data).before($(_s.target));
                                    break;
                                default:
                                    $(_s.target).html(data);
                                    break;
                            }


                        }
                        
                        if (_s.state && window.history.pushState) {
                            history.pushState(null, _s.title, u);
                            
                            
                        }
                        
                        if (_s.onComplete) {
                            if ($.isFunction(_s.onComplete))
                                _s.onComplete.call(this, data);
                            else
                                eval(_s.onComplete);
                           
                        }

                        if (_s.loading && $.Loading) {
                            $.Loading.hide();
                        }

                        /* if (window.history && window.history.pushState) {
                        window.history.pushState(null, null, u);
                        }*/
                    }

                }).error(function (xhr, ajaxOptions, thrownError) {
                    if (_s.onError) {
                        if ($.isFunction(_s.onError))
                            _s.onError.call(this, xhr, ajaxOptions, thrownError);
                        else
                            eval(_s.onError);
                    }

                    else {
                        alert('Error:' + xhr.status + '\n' + thrownError);
                    }

                });
            } //end load

        }
    });


})(jQuery);