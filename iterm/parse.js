'use strict';
var parsedJSON = require('./profile.json');
var colors = ["Red Component", "Green Component", "Blue Component"];
var out = [];

for (var k in parsedJSON) {
	if (k.indexOf("Color") >= 0) {
		var hex = '';
		for (var c in colors) {
			var val = parsedJSON[k][colors[c]] * 255;
			let hex_val = '00' + Math.floor(val).toString(16);
			if (val == 0) {
				hex += '00';
			} else {
				hex += hex_val.slice(-2);
			}
		}
		out.push({name: k, value: hex});
	}
}

function sortByKey(array, key) {
    return array.sort(function(a, b) {
        var x = a[key]; var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}
console.log(sortByKey(out, 'name'));
