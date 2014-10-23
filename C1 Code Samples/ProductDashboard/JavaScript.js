function hintContent() {
    return (this.data.label + ' ' + Globalize.format(this.value));
}

function hintValue() {
    return Globalize.format(Math.round(this.data.y) + "%");
}

function unitshintValue()
{
    return Globalize.format(Math.round(this.y));
}
Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(
function () {
    if (document.getElementById) {
        var blur = document.getElementById('blur');
        var progress = document.getElementById('progress');
        //progress.disabled = true;
        //blur.disabled = true;
        progress.style.width = '200px';
        progress.style.height = '120px';
        blur.style.height = document.documentElement.clientHeight;
        progress.style.top = document.documentElement.clientHeight / 3 - progress.style.height.replace('px', '') / 2 + 'px';
        progress.style.left = document.body.offsetWidth / 2 - progress.style.width.replace('px', '') / 2 + 'px';
            
    }
})
function sector(cx, cy, r, startAngle, endAngle, params) {
    var x1 = cx + r * Math.cos(-startAngle * rad),
            x2 = cx + r * Math.cos(-endAngle * rad),
            y1 = cy + r * Math.sin(-startAngle * rad),
            y2 = cy + r * Math.sin(-endAngle * rad);
    return paper.path(["M", cx, cy, "L", x1, y1, "A", r, r, 0, +(endAngle - startAngle > 180), 0, x2, y2, "z"]).attr(params);
}

function face(ui) {
    var a = ui.canvas.path($.wijraphael.sector(ui.origin.x, ui.origin.y, ui.r, 0, 180)),
                    b = ui.canvas.path($.wijraphael.sector(ui.origin.x, ui.origin.y, ui.r / 6, 180, 0)),
                    style = {
                        fill: "#ff9900",
                        FillOpacity:"0.6",
                        stroke: "#E0E8EF"
                    };
    a.attr(style);
    b.attr(style);
    //return ui.canvas.image(url, ui.origin.x - ui.r, ui.origin.y - ui.r, ui.r * 2, ui.r * 2);
}