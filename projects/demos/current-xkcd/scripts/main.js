var jsonobj = jQuery.getJSON('https://dynamic.xkcd.com/api-0/jsonp/comic?callback=?');

if (jsonobj != null)
{
    $("#imgTest").attr("src",jsonobj.responseJSON.img);
}
else 
{
    console.log("jsonobj is null");
}