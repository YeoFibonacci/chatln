$(document).ready(function() {
    var max = 600;
    $(".readMore").each(function() {
        var str = $(this).text();
        if ($.trim(str).length > max) {
            var subStr = str.substring(0, max);
            var hiddenStr = str.substring(max, $.trim(str).length);
            $(this).empty().html(subStr);
            $(this).append(' <a href="javascript:void(0);" class="lire-plus button is-info is-outlined mb-2 ml-2 rounded ">Lire la suite...</a> <br> ');
            $(this).append('<span class="addText">' + hiddenStr + '</span>');
        }
    });
    $(".lire-plus").click(function() {
        $(this).siblings(".addText").contents().unwrap();
        $(this).remove();
    });
});
