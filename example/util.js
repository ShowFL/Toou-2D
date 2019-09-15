var t2d_version;

WorkerScript.onMessage = function(msg) {
    if (msg.action === 'httpget') {
        t2d_version = msg.version;
        var url = "http://oss.toou.net/github-resources/2d/demo.json";
        console.log(url);
        httpget(url)
    }
}

function httpget(url){
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState === XMLHttpRequest.DONE) {
            if(doc.status === 200) {
                finished(doc.responseText)
            }else {
                WorkerScript.sendMessage({"error":true,"info":"网络错误，请稍后尝试!"});
            }
        }
    }
    doc.open("GET", url);
    doc.send();
}

function finished(data){
    try{
        var demolist = JSON.parse(data);
        WorkerScript.sendMessage(demolist);
    }catch(e){
        WorkerScript.sendMessage({"error":true,"info":"数据错误，请稍后尝试!"});
    }
}


function toNum(a){
    var va = a.toString();
    var vc = a.split('.');
    var num_place = ["","0","00","000","0000"],r = num_place.reverse();
    for (var i = 0;i < vc.length;i++){
        var len = vc[i].length;
        vc[i] = r[len] + vc[i];
    }
    var res = vc.join('');
    return res;
}
