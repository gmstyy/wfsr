﻿/*xmst.js v1.3.6*/(function(){function f(){var a=location.hostname,b=a.split(".");size=b.length;var c="."+b[size-2]+"."+b[size-1];return c}
function g(){return 
navigator.language||navigator.userLanguage||navigator.browserLanguage||navigator.systemLanguage}
function h(){return navigator.vendor}
function j(){return 
navigator.platform}
function k(){return screen.width+"*"+screen.height}
function l(a,b,c,d){var e=arguments.length;e==3?document.cookie=a+"="+b+";path=/;domain="+
c:document.cookie=a+"="+b+";path=/;domain="+c+";expires="+d}
function m(a){var b=document.cookie,c=n(b),d=c.split(";");for(var e=0;e<d.length;e++){var f=d[e].
split("=");if(f.length>1&&f[0]==a)return f[1]}return""}
function n(a){var b="";for(var c=0;c<a.length;c++){var d=a.charAt(c);d!=" "&&(b+=d)}return b}
function o
(){return b.round(2147483647*b.random())}
function p(a,b){var c=new Date;c.setTime(c.getTime()+31104e6);var d=a+"="+b+";"+"path=/;domain="+f()+";expires="+c.
toGMTString();window.document.cookie=d}
function q(a){var b=/.*\:\/\/([^\/]*).*/,c=a.match(b),d="";return typeof c!="undefined"&&null!=c&&(d=c[1]),d}
function r
(){var a=new Date,b=a.getTime()+"_"+Math.round(Math.random()*1e4);return b}
function s(){var a="";if(e==[])return"";for(var b in e)a+="&"+b+"="+e[b];return a}
function t(a){var b=document.createElement("script");b.type="text/javascript",b.async=!0,b.src=a;var c=document.getElementsByTagName("script")[0];c.parentNode.
insertBefore(b,c)}function u(){var a=document.location.href.replace(/&/g,"|"),b=document.referrer.replace(/&/g,"|");b=b.toLowerCase();if(b){var c=q(b);(c.
indexOf(".xiaomi.com")<0||c.indexOf("p.www.xiaomi.com")>-1||c.indexOf("a.union.xiaomi.com")>-1)&&p("lastsource",c)}var d=m("xm_www_sid"),e=m("mstuid"),i=m(
"muuid"),n=m("mucid"),s=m("mstz")||"";if(s===""){var t=[];t[0]="",t[1]="",t[2]=o().toString()+"."+0;var u="mstz",v=t.join("|");l(u,v,f())}s=m("mstz");var w=s.
split("|")||[],x=w.length==4?0:1,y=w[0]||"",z=w[1]||"",A=[];A=w[2].split(".");var B=A[0],C=parseInt(A[1])+1;w[2]=A[0]+"."+C.toString(),l("mstz",w.join("|"),f
());var D=m("lastsource"),E=0;if(e===""){E=1,e=r();var F=new Date;F.setTime(F.getTime()+31104e6),l("mstuid",e,f(),F.toGMTString())}var G="",H=new Date;if(x)G=
"mid="+m("userId")+"&phpsessid="+d+"&mstuid="+e+"&muuid="+i+"&mucid="+n+"&sessionId="+B+"&step="+C+"&new_visitor="+E+"&mstprevpid="+y+"&prevtarget="+z+
"&lastsource="+D+"&timestamp="+H.getTime()+"&ref="+encodeURIComponent(b)+"&domain="+f()+"&screen="+k()+"&language="+g()+"&vendor="+h()+"&platform="+j();else{var
 I=w[3]||"";G="mid="+m("userId")+"&phpsessid="+d+"&mstuid="+e+"&muuid="+i+"&mucid="+n+"&sessionId="+B+"&step="+C+"&new_visitor="+E+"&mstprevpid="+y+
"&mstprev_pid_loc="+I+"&prevtarget="+z+"&lastsource="+D+"&timestamp="+H.getTime()+"&ref="+encodeURIComponent(b)+"&domain="+f()+"&screen="+k()+"&language="+g()+
"&vendor="+h()+"&platform="+j()}return G}function v(a){t(a)}function w(a){return"function"==typeof a}var a="prototype",b=Math,c="",d="",e=[],x=function(){this.p
=[]},y=x[a];y.trackPageView=function(){var a=u(),b=s();v(z+a+b)},y.push=function(a){if(w(a[0])){a[0](a.slice(1));return}y[a[0]](a.slice(1))},y.setDomainId=
function(a){e.domain_id=a[0]},y.setUid=function(a){e.uid=a[0]},y.setVars=function(a){e[a[0]]=a[1]},y.trackEvent=function(a){var b="",c="",d="",e="",i="",n="",o=
new Date,p=m("mstz").split("|"),q="",r="",t="",u="",w=0;q=p[0],r=p[1],t=p[2].split(".")[0];var x=a.length==4?1:0;x?(b=a[1],i=a[2],d=a[3],q!=i&&(p[0]=i,w=1)):(c=
a[0],d=a[1],e=a[2],p[0]=c,u=p[3]||"",u!=e&&(p[3]=e,w=1));var o=new Date,y=m("xm_www_sid");r!=d&&(p[1]=d,w=1),w&&l("mstz",p.join("|"),f());var A="mid="+m(
"userId")+"&phpsessid="+y+"&mstuid="+m("mstuid")+"&sessionId="+t+"&muuid="+m("muuid")+"&mucid="+m("mucid")+"&mstprevpid="+q+"&lastsource="+m("lastsource")+
"&timestamp="+o.getTime()+"&domain="+f()+"&screen="+k()+"&language="+g()+"&vendor="+h()+"&platform="+j(),B="";x?B="mstpid="+i+"&"+A+"&target="+d+"&prevtarget="+
r+"&category="+b:B="mstpid="+c+"&"+A+"&target="+d+"&prevtarget="+r+"&pid_loc="+e+"&mstprev_pid_loc="+u;var C=s();v(z+B+C)};var z=
"http://a.stat.xiaomi.com/js/mstr.js?",A=new x;A.p=window._msq;for(i=0;i<A.p.length;i++)A.push(A.p[i]);window._msq=A})();