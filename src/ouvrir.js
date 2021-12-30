openDic = function (id){
  copyTextToClipboard(id);
  var text = document.getElementById(id).innerHTML ;
  // let result = text.replace(/ /g, "+");
  var chaine="http://dictionary.sensagent.com/"+text+"/el-en/"
  window.open(chaine);
}

