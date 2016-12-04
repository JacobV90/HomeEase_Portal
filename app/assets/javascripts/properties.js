

$(function() {
    $("div#myDropZone").dropzone({
        url : "/file-upload"
    });
});

function getThumbnail(name)
{
    var image_url = name ;

    $.get(image_url)
        .done(function()
        {
            return image_url;
        })
        .fail(function()
        {
            return "HomeeaseSkyline";
        })
}


