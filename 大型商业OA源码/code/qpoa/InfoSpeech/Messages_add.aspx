﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages_add.aspx.cs" Inherits="qpoa.InfoSpeech.Messages_add" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<script>
function chknull()
{
if(document.getElementById('title').value=='')
{
alert('标题不能为空');
form1.title.focus();
return false;
}	

if(document.getElementById('acceptrealname').value=='')
{
alert('接收人不能为空');
form1.acceptrealname.focus();
return false;
}	


showwait();					



}

</script>



<head id="Head1" runat="server">
    <title>网络办公系统</title>
        <LINK href="../css/public.css" type="text/css" rel="stylesheet">
         <LINK href="../css/style_oa_30.css" type="text/css" rel="stylesheet">
</head>
<body class="newbody">
    <form id="form1" runat="server">
    <!--#include file="../public/pleasewait.htm"-->
    <!--#include file="../public/public.js"-->
    <script language="javascript" src="../public/DateSelect.js"></script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
              </td>
        </tr>
      </table>
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
           <div id="printshow1">
          <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="17">&nbsp;</td>
                <td valign="top"> <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="3%"><img src="../images/top_3.gif" ></td>
                       <td width="81%" valign="bottom"><a href="../main_d.aspx"  class="line_b">工作台</a> >>&nbsp; 新增内部消息</td>
                      <td width="81%">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0" background="../images/lingbg.jpg">
                    <tr> 
                      <td></td>
                    </tr>
                  </table></td>
                <td width="17">&nbsp;</td>
              </tr>
            </table>
             </div>
            </td>
        </tr>
      </table>
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
            <div id="printshow2"> 
          <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="17">&nbsp;</td>
                <td valign="top"> 
           <table align="center" background="../images/bg0003.gif" border="0" cellpadding="0"
                        cellspacing="0" width="100%">
                        <tr>
                            <td width=30% style="height: 26px">
                                <button class="btn4off" 
                                    type="button">
                                    <font class="shadow_but">内部消息</font></button></td>
                              <td style="height: 26px" align="right" > 
                                  <a href="javascript:void(0)"></a></td>
                        </tr>
                    </table>
                </td>
                <td width="17">&nbsp;</td>
              </tr>
            </table>
            </div>
            <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="17">
                        &nbsp;</td>
                    <td valign="top" >
                  
                        <table align="center" class="newtable" border="0" cellpadding="4" cellspacing="1"
                            width="100%" id="tableprint">
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    消息标题：</td>
                                <td class="newtd2" height="17" colspan="3" width="83%">
                                    <asp:TextBox ID="title" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    消息内容：</td>
                                <td class="newtd2" height="17" colspan="3">
                                    <asp:TextBox ID="content" runat="server" Height="107px" TextMode="MultiLine" Width="95%"></asp:TextBox></td>
                            </tr>                          
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    接收人：</td>
                                <td class="newtd2" colspan="3" height="17">
                                     <asp:TextBox ID="acceptrealname" runat="server" Height="55px" TextMode="MultiLine" Width="85%"></asp:TextBox><A href="javascript:void(0)"><IMG onclick="openuser1();" alt="" src="../images/FDJ.gif" border="0"></A></td>
                            </tr>
                             <tr  id="printshow3">
                                <td align="center" class="newtd2" colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
                                            <asp:Button ID="Button2" runat="server" CssClass="button_blue" OnClick="Button1_Click"
                                                Text="确 定" />
                                            &nbsp; &nbsp;
                                            <input id="Button1" class="button_blue" onclick="history.back()" type="button" value="返 回" /></FONT>&nbsp;</div> </td>
                            </tr>
                          
                        </table>
                        
           
                        
                    </td>
                    <td width="17" >
                        &nbsp;</td>
                </tr>
            </table>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<asp:TextBox ID="acceptusername" runat="server" Width="90%"  style="DISPLAY: none"></asp:TextBox>
<script language="javascript">	

var  wName_1;  
function  openuser1()  
{  
var num=Math.random();
var str=""+document.getElementById('acceptusername').value+"";
wName_1=window.showModalDialog("../OpenWindows/open_Username.aspx?tmp="+num+"&requeststr="+str+"","window", "dialogWidth:650px;DialogHeight=580px;status:no;scroll=yes;help:no");                
var arr = wName_1.split("|");
for(var i=0;i<arr.length;i++)
{ 
document.getElementById("acceptusername").value=arr[0]; 
document.getElementById("acceptrealname").value=arr[1]; 
}
}



</script>  

<script type="text/javascript">
	    parent.closeAlert('UploadChoose');
	</script>

    </form>
</body>
</html>