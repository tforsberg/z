/*
    *
    * Wijmo Library 5.20142.6
    * http://wijmo.com/
    *
    * Copyright(c) GrapeCity, Inc.  All rights reserved.
    * 
    * Licensed under the Wijmo Commercial License. 
    * sales@wijmo.com
    * http://wijmo.com/widgets/license/
    *
    */
/*
* Wijmo culture file: ja (Japanese)
*/
var wijmo;
(function (wijmo) {
    wijmo.culture = {
        Globalize: {
            numberFormat: {
                '.': '.',
                ',': ',',
                percent: { pattern: ['-n%', 'n%'] },
                currency: { decimals: 0, symbol: '¥', pattern: ['-$n', '$n'] }
            },
            calendar: {
                '/': '/',
                ':': ':',
                firstDay: 0,
                days: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
                daysAbbr: ['日', '月', '火', '水', '木', '金', '土'],
                months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                monthsAbbr: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                am: ['午前', '午'],
                pm: ['午後', '午'],
                //eras: ['西暦'],
                eras: [
                    { name: '平成', symbol: 'H', start: new Date(1989, 0, 8) },
                    { name: '昭和', symbol: 'S', start: new Date(1926, 11, 25) },
                    { name: '大正', symbol: 'T', start: new Date(1912, 6, 30) },
                    { name: '明治', symbol: 'M', start: new Date(1868, 8, 8) }
                ],
                patterns: {
                    d: 'ggg yy/M/d', D: 'ggg yy"年"M"月"d"日"',
                    f: 'ggg yy"年"M"月"d"日" H:mm', F: 'ggg yy"年"M"月"d"日" H:mm:ss',
                    t: 'H:mm', T: 'H:mm:ss',
                    m: 'M"月"d"日"', M: 'M"月"d"日"',
                    y: 'ggg yy"年"M"月"', Y: 'ggg yy"年"M"月"',
                    g: 'ggg yy/M/d H:mm', G: 'ggg yy/M/d H:mm:ss',
                    s: 'yyyy"-"M"-"d"T"HH":"mm":"ss'
                }
            }
        },
        FlexGrid: {
            groupHeaderFormat: '{name}: <b>{value} </b>({count} 項目)'
        }
    };
})(wijmo || (wijmo = {}));
;
//# sourceMappingURL=wijmo.culture.ja.js.map

