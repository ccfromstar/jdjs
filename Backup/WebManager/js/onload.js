$(document).ready(function() {

    $("a").bind("focus", function() {
        if (this.blur) { this.blur() };
    });
    $("input[type=text]").addClass("input");
    $("input[type=password]").addClass("input");
    $("input[type=button]").addClass("Button");
    $("input[type=text]").focus(function() {
        $(this).css("border-color", "#FF8800");
    });
    $("input[type=text]").blur(function() {
        $(this).css("border-color", "#778899 #AABBCC #AABBCC #8899AA");
    });
    $(".dataTableHead td").mouseover(function() {
        $(this).attr("className", "thOver");
    });
    $(".dataTableHead td").mouseout(function() {
        $(this).attr("className", "");
    });
    $(".dataTableBody").mouseover(function() {
        $(this).css("background", "#2c95d7");
    });
    $(".dataTableBody").mouseout(function() {
        $(this).css("background", "none");
    });
    $(".dataTableBody").click(function() {
        $(this).find("input[type=checkbox]").attr("checked", true);
    });
    $(".LeftTab li").click(function() {
        $(".LeftTab li").attr("className", "unchecked");
        $(this).attr("className", "checked");
    });
    $("#HideImg").click(function() {
        $("#Hidetr").css("display", "none");
        $("#Showtr").css("display", "block");
    });
    $("#ShowImg").click(function() {
        $("#Showtr").css("display", "none");
        $("#Hidetr").css("display", "block");
    });
//    ChangeSize();
//    var resizeTimer = null;
//    $(window).bind('resize', function() {
//        if (resizeTimer) clearTimeout(resizeTimer); resizeTimer = setTimeout(ChangeSize, 100);
//    });
});

//function ChangeSize() {
//    var cHeight = document.documentElement.clientHeight;
//    document.getElementById("tbContent").style.height = (cHeight - document.getElementById("content").offsetHeight + document.getElementById("tbContent").offsetHeight) + "px"
//}

