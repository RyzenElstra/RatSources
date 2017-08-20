code = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
ci = 0;

$("body").keyup(function (e) {
    if (e.keyCode == code[ci]) {
        ci++;
        if (ci >= code.length) {
            $("#about").html("<p><strong>Greetings to all GAiA Members!</strong></p> \
						<p>Currently justquant, Toxoid_49b, CliftonM, xal0gic, Techel and Me (Leurak)</p>");
            $("#aboutModal").modal();
            ci = 0;
        }
    } else {
        ci = 0;
    }
});