﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chatName_add.aspx.cs" Inherits="qpoa.InfoSpeech.chatName_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<script>
function chknull()
{
    if(document.getElementById('Name').value=='')
    {
    alert('聊天室名不能为空');
    form1.Name.focus();
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
              <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox></td>
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
                       <td width="81%" valign="bottom"><a href="../main_d.aspx"  class="line_b">工作台</a> >> <a href="chatName.aspx"  class="line_b">聊天室管理</a> >> 新增聊天室信息</td>
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
                                <button class="btn4off6k" 
                                    type="button">
                                    <font class="shadow_but">聊天室管理</font></button></td>
                              <td style="height: 26px" align="right" > &nbsp;</td>
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
                            width="100%">
                            <tr>
                                <td align="center" class="newtd2" colspan="4" width="33%" style="height: 26px">
                                    <b> 聊天室信息</b></td>
                            </tr>
                            <tr>
                            <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    聊天室名：</td>
                                <td class="newtd2" height="17" colspan="3" width="85%">
                                    <asp:TextBox ID="Name" runat="server" Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                            <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    描述：</td>
                                <td class="newtd2" height="17" colspan="3" width="85%">
                                    <asp:TextBox ID="remark" runat="server" Width="90%" MaxLength="1027"></asp:TextBox>
                                </td>
                            </tr>                          
                            
                            
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    类别状态：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:DropDownList ID="State" runat="server" Width="90%">
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>停用　</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    参加人员：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                <asp:TextBox ID="GxRealname" runat="server" Height="34px" TextMode="MultiLine" Width="85%"></asp:TextBox><A href="javascript:void(0)"><IMG onclick="openunit()" src="../images/FDJ.gif" border="0"></A></td>
                            </tr>
                            <tr  id="printshow3">
                                <td align="center" class="newtd2" colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
                                <asp:Button ID="Button1" runat="server" Text="确 定" CssClass="button_blue" OnClick="Button1_Click" />
                                &nbsp; &nbsp; &nbsp;<asp:Button ID="Button2" runat="server" Text="返 回" CssClass="button_blue" OnClick="Button2_Click" />
                             
								</FONT>
							</div> </td>
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
<asp:TextBox ID="GxUsername" runat="server" Width="90%" style="DISPLAY: none"></asp:TextBox>
 
 <script language="javascript">	
var  wName_2;  
function  openunit()  
{  
var num=Math.random();
var str=""+document.getElementById('GxUsername').value+"";
wName_2=window.showModalDialog("../OpenWindows/open_Username.aspx?tmp="+num+"&requeststr="+str+"","window", "dialogWidth:650px;DialogHeight=580px;status:no;scroll=yes;help:no");                
var arr = wName_2.split("|");
for(var i=0;i<arr.length;i++)
{ 
document.getElementById("GxUsername").value=arr[0]; 
document.getElementById("GxRealname").value=arr[1]; 
}
}


</script>    
    
    
    </form>
</body>
</html>