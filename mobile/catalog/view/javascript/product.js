var top = window.screen.height / 2 - 250;
var left = window.screen.width / 2 - 300;

/*title是标题，rLink链接，summary内容，site分享来源，pic分享图片路径,分享到新浪微博*/
function shareTSina(title,rLink) {
   
    window.open("http://service.weibo.com/share/share.php?&title=" + 
    encodeURIComponent(title.replace(/&nbsp;/g, " ").replace(/<br \/>/g, " "))+ "&url=" + encodeURIComponent(rLink),
    "分享至新浪微博",
    "height=500,width=600,top=" + top + ",left=" + left + ",toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
    
}

/*,分享到qq空间*/
function shareQzone(title,rLink) {
	  window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title='+
                       encodeURIComponent(title)+'&url='+encodeURIComponent(rLink)
                       ,'_blank','scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes');
  
	 }

/*,分享到人人*/
function shareRR(title,rLink){   
    window.open('http://share.renren.com/share/buttonshare/post/1004?title='+encodeURIComponent(title)+'&url='+
     encodeURIComponent(rLink),'_blank',
     'scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes'); 
}


//开心网 
function shareKX(title,rLink,summary){    
	 title = "标题。";
	 rLink = "http://www.abc.com/heeh.html";
        window.open('http://www.kaixin001.com/repaste/bshare.php?rtitle='+encodeURIComponent(title)+
        '&rurl='+encodeURIComponent(rLink)+
'&rcontent='+encodeURIComponent(summary),'_blank',
        'scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes');   
} 

//腾讯微博
function shareToWb(title,rLink){   
         window.open('http://v.t.qq.com/share/share.php?url='+encodeURIComponent(rLink)+
          '&title='+encodeURI(title),'_blank',
           'scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes');     
}


   
  /*分享到豆瓣*/
  function shareToDouBan(title, productUrl){  
    
      window.open("http://www.douban.com/recommend/?url=" + productUrl + "&title=" + encodeURI(title));
	     
 }  
 
