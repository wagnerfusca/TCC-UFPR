<?php 
error_reporting(1);if(function_exists('import_request_variables')){import_request_variables("gpc");$REMOTE_ADDR=$HTTP_SERVER_VARS['REMOTE_ADDR'];$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];$SERVER_NAME=$HTTP_SERVER_VARS['SERVER_NAME'];$SCRIPT_NAME=$HTTP_SERVER_VARS['SCRIPT_NAME'];}
$datetime=gmdate('M j, G:i',time()+(-3)*3600);$pp=time();
$log="data/log";$usr="data/usronline";$usr_list="data/usrlist";$main_chat="data/main";$moderate="data/moderate";$ip_addr="data/ipadmin";$ms="data/ms";$tmp_moderate="data/tmpmoderate";
set_magic_quotes_runtime(0);
$dbl='a';function ccl(){global $dbl;if($dbl=='a'){$dbl='b';}else{$dbl='a';}}

// Lê e escreve o log
function opl(){global $log;$fd=fopen($log,"r") or die('...1');$fs=fread($fd,filesize($log));fclose($fd);return $fs;}
function wrl($n){global $log;$fd=fopen($log,"w") or die('...2');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve as mensagens do chat
function opm(){global $main_chat;$fd=fopen($main_chat,"r") or die('...3');$fs=fread($fd,filesize($main_chat));fclose($fd);return $fs;}
function wrm($n){global $main_chat;$fd=fopen($main_chat,"w") or die('...4');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve as mensagens a serem moderadas
function opd(){global $moderate;$fd=fopen($moderate,"r") or die('...5');$fs=fread($fd,filesize($moderate));fclose($fd);return $fs;}
function wrd($n){global $moderate;$fd=fopen($moderate,"w") or die('...6');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve os ip´s de administrador
function opi(){global $ip_addr;$fd=fopen($ip_addr,"r") or die('...7');$fs=fread($fd,filesize("$ip_addr"));fclose($fd);return $fs;}
function wri($n){global $ip_addr;$fd=fopen($ip_addr,"w") or die('...8');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve os usuários online
function opu(){global $usr;$fd=fopen($usr,"r") or die('...9');$fs=fread($fd,filesize($usr));fclose($fd);return $fs;}
function wru($n){global $usr;$fd=fopen($usr,"w") or die('...10');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve o log de usuários
function opul(){global $usr_list;$fd=fopen($usr_list,"r") or die('...11');$fs=fread($fd,filesize($usr_list));fclose($fd);return $fs;}
function wrul($n){global $usr_list;$fd=fopen($usr_list,"w") or die('...12');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve status do moderador
function opms(){global $ms;$fd=fopen($ms,"r") or die('...13');$fs=fread($fd,filesize($ms));fclose($fd);return $fs;}
function wrms($n){global $ms;$fd=fopen($ms,"w") or die('...14');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}

// Lê e escreve temp do moderador
function optd(){global $tmp_moderate;$fd=fopen("$tmp_moderate","r") or die('...15');$fs=fread($fd,filesize($tmp_moderate));fclose($fd);return $fs;}
function wrtd($n){global $tmp_moderate;$fd=fopen($tmp_moderate,"w") or die('...16');if($n==''){$n="\n";};$fout=fwrite($fd,$n);fclose($fd);}


function sdd($q){die("<html><head><script type=\"text/javascript\">window.location='$q';</script><title>...</title></head><body></body></html>");}
function duu($r){$users='';$fy=opu();$fy=explode("\n",$fy);$fz=array();$j=0;for($i=0;$i<count($fy);$i++){if(isset($fy[$i])&&strlen($fy[$i])>4){$we=explode(":|:",$fy[$i]);$fz[$j]="$we[2]:|:$we[3]:|:$we[1]";$j++;}}rsort($fz);for($i=0;$i<count($fz);$i++){$wg=explode(":|:",$fz[$i]);$users="<img src=\"pics/$wg[1].gif\" width=\"11\" height=\"14\" alt=\"\" title=\"$wg[2]\"> <b>$wg[0]</b>$r$users";}print $users;}
function htmsp($w){$w=stripslashes($w);$w=str_replace("<","&lt;",$w);$w=str_replace(">","&gt;",$w);$w=str_replace("\r\n"," ",$w);$w=str_replace("\r","",$w);$w=str_replace("\n"," ",$w);return $w;}
function htmse($w){$w=htmsp($w);$w=str_replace(":|:"," ",$w);$w=str_replace("\\\"","&quot;",$w);return $w;}
function moderate(){$fs=opms();if($fs=="1"){return TRUE;}else{return FALSE;}}

header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-cache, must-revalidate");
header("Pragma: no-cache");

if(isset($nyc)){setcookie('myc',$nyc,time()+86400*100,'/');}elseif(!isset($myc) && !isset($nyc)){setcookie('myc','20',time()+86400*100,'/');$nyc='20';}else{$nyc=$myc;}
if(isset($wik)){setcookie('bik',$wik,time()+86400*100,'/');}elseif(!isset($bik) && !isset($wik)){setcookie('bik','1',time()+86400*100,'/');$wik='1';}else{$wik=$bik;}

if(!is_file($log)||!is_writeable($log)||!is_file($usr)||!is_writeable($usr)||!is_file($main_chat)||!is_writeable($main_chat)||!is_file($moderate)||!is_writeable($moderate)||!is_file($tmp_moderate)||!is_writeable($tmp_moderate)){
$fd=fopen($log,"w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 1) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');$fout=fwrite($fd,"\n");fclose($fd);
$fd=fopen($main_chat,"w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 2) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');$fout=fwrite($fd,"\n");fclose($fd);
$fd=fopen($moderate,"w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 3) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');$fout=fwrite($fd,"\n");fclose($fd);
$fd=fopen($tmp_moderate,"w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 4) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');$fout=fwrite($fd,"");fclose($fd);
$fd=fopen("$ip_addr","w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 5) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');$fout=fwrite($fd,"\n");fclose($fd);
$fd=fopen($ms,"w+") or die('<div align="center" style="color:red;background-color:white"><h3><br><br>WARNING! Create an <u>empty</u> directory(erro 6) /<i style="color:green">data</i> and CHMOD it to 777!</h3></div>');fclose($fd);
$fd=fopen($usr,"w+") or die('...');$fout=fwrite($fd,"\n");fclose($fd);$fd=fopen($usr_list,"a") or die('...');$fout=fwrite($fd,"\n");fclose($fd);}

include "lang/lang-copel.inc";
?>
