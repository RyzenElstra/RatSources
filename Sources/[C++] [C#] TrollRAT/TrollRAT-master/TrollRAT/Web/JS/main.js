block = false;
blockUpdate = false;

payloadsRequest = {
    url: "/payloads", data: {}, old: "", checkOld: true, out: "#payloads", done: function () {
        updateFilter();
        if (active != -1) $("#payloads").children().eq(active).addClass("active");
    }
};

payloadData = {};
actionsRequest = { url: "/actions", data: payloadData, old: "", checkOld: true, out: "#actions" };
globalActionsRequest = { url: "/globalactions", data: {}, old: "", checkOld: true, out: "#globalActions" };
settingsRequest = { url: "/settings", data: payloadData, checkOld: false, out: "#settings" };

function serverFail() {
    blockUpdate = true;
    $("#status").html("Connection Lost");
    window.setTimeout(function () { blockUpdate = false; }, 5000);
}

function update() {
    if (blockUpdate)
        return;

    blockUpdate = true;

    var scrollY = $(document).scrollTop();

    $("#status").html("Updating...");
    active = payloadData["payload"] = $("#payloads").children().index($("#payloads .active"));

    var l = new Array();

    l.push(payloadsRequest);
    l.push(actionsRequest);
    l.push(globalActionsRequest);

    if ($("#settings").find($(":focus")).size() == 0)
        l.push(settingsRequest);

    loadContent(l, 0, function () {
        blockUpdate = false;
        $(document).scrollTop(scrollY);
    });
}

function onPayloadSelected(obj) {
    if (block)
        return;

    blockUpdate = true;
    $("#status").html("Loading Payload Data...");
    active = payloadData["payload"] = $("#payloads").children().index($(obj));

    $("#payloads > .list-group-item").each(function () {
        $(this).removeClass("active");
    });

    loadContent([
        actionsRequest, settingsRequest
    ], 0, function () {
        $(obj).addClass("active");
        blockUpdate = false;
    });
}

function loadContent(l, i, done) {
    var obj = l[i++];

    obj.data["nocache"] = new Date().getTime();
    $.ajax({
        method: "GET",
        url: obj.url,
        data: obj.data
    }).done(function (response) {
        if (!obj.checkOld || response != obj.old) {
            $(obj.out).html(response).promise().done(function () {
                if (obj.hasOwnProperty("done"))
                    obj.done();

                if (i < l.length)
                    loadContent(l, i, done);
                else {
                    if (typeof done !== "undefined")
                        done();

                    $("#status").html("Ready");
                }
            });

            obj.old = response;
        } else {
            if (i < l.length)
                loadContent(l, i, done);
            else {
                if (typeof done !== "undefined")
                    done();

                $("#status").html("Ready");
            }
        }
    }).error(function () {
        serverFail();
    });
}

function updateFilter() {
    $("#payloads .list-group-item").each(function () {
        if ($(this).html().toLowerCase().indexOf($("#filter").val().toLowerCase()) == -1) {
            $(this).addClass("hidden");
        } else {
            $(this).removeClass("hidden");
        }
    });
}

function execute(id) {
    block = true;
    window.setTimeout(function () { block = false }, 100);

    $.ajax({
        method: "GET",
        url: "/execute",
        data: { "id": id, "nocache": new Date().getTime() }
    }).error(function () {
        serverFail();
    });
}

function globalAction(id) {
    $.ajax({
        method: "GET",
        url: "/globalaction",
        data: { "id": id, "nocache": new Date().getTime() }
    }).error(function () {
        serverFail();
    });
}

function generateCode() {
    $.ajax({
        method: "GET",
        url: "/generatecode",
        data: { "nocache": new Date().getTime() }
    }).done(function (code) {
        $("#shareCode").val(code);
    }).error(function () {
        serverFail();
    });
}

function setSetting(id, value) {
    $.ajax({
        method: "GET",
        url: "/set",
        data: { "id": id, "value": value, "nocache": new Date().getTime() }
    }).error(function () {
        serverFail();
    });
}

$("#noscript").remove();

update();
window.setInterval(update, 1000);