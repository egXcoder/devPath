window.getCookie = function(cookie) {
    var match = document.cookie.match(new RegExp('(^| )' + cookie + '=([^;]+)'));
    if (match) return match[2];
    return (match) ? match[2] : false;
}