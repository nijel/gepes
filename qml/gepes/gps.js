/* GPS utility functions */
.pragma library

function to_deg(val) {
    var deg = parseInt(val);
    var remain = (val - deg) * 60;
    var min = Math.floor(remain);
    remain = (remain - min) * 60;
    var sec = Math.round(remain * 1000) / 1000;

    return deg + "°" + min + "'" + sec + "\"";
}

function fmt_lat(val) {
    var dir = "N";
    if (val < 0) {
        dir = "S"
        val = -val;
    }
    return to_deg(val) + dir;
}

function fmt_lon(val) {
    var dir = "E";
    if (val < 0) {
        dir = "W"
        val = -val;
    }
    return to_deg(val) + dir;
}


function printNum(num) {
    return Math.round(num) / 10;
}
