﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAttendance_show.aspx.cs" Inherits="qpoa.MyAffairs.MyAttendance_show" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<script>
function chknull()
{
    if(document.getElementById('Subject').value=='')
    {
    alert('事由不能为空');
    form1.Subject.focus();
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
                      <td width="81%" valign="bottom"><a href="../main_d.aspx" class="line_b">工作台</a> >>  个人考勤  >>  <a href=MyAttendance.aspx?type=<%=Request.QueryString["Type"]%> class="line_b"><%=Typename %></a>  >>  查看<%=Typename %></td>
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
                                    <font class="shadow_but"><%=Typename%></font></button></td>
                              <td style="height: 26px" align="right" >  
                              
                              <a href="javascript:void(0)"><img border="0" onclick="printpage()" src="../images/button_print.jpg" /></a></td>
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
                                    width="15%">
                                    事由：</td>
                                <td class="newtd2" height="17" colspan="3" width="85%">
                                    <asp:Label ID="Subject" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                             <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    开始时间：
                                </td>
                                <td class="newtd2" height="17" width="35%">
                                    <asp:Label ID="StartTime" runat="server" Width="90%"></asp:Label></td>
                                  <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                      结束时间：
                                </td>
                                <td class="newtd2"  height="17" width="35%">
                                    <asp:Label ID="EndTime" runat="server" Width="90%"></asp:Label></td>    
                                 
                                 
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                     <%=DiffTimeName %>：
                                </td>
                                <td class="newtd2" height="17" width="35%">
                                    <asp:Label ID="DiffTime" runat="server" Width="90%"></asp:Label></td>
                                  <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                      登记人：
                                </td>
                                <td class="newtd2"  height="17" width="35%">
                                    <asp:Label ID="Realname" runat="server" Width="90%"></asp:Label></td>    
                                 
                                 
                            </tr>                       
                            
                            
                             <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">备注： 
                                </td>
                                <td class="newtd2" colspan="3" height="17" width="85%" >
                                    <asp:Label ID="Remark" runat="server" Width="90%"></asp:Label></td>
                            </tr>   
                            
                             <tr>
                                <td class="newtd2" colspan="4" height="17" align=center>
                                    <strong>审批信息</strong></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    审批状态：</td>
                                <td class="newtd2" height="17" width="35%">
                                    <asp:Label ID="Shenpi" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    审批人：</td>
                                <td class="newtd2" height="17" width="35%">
                                    <asp:Label ID="SpRealname" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    审批时间：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:Label ID="SpTimes" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                             <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    审批备注：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%" >
                                    <asp:Label ID="SpRemark" runat="server" Width="90%"></asp:Label></td>
                            </tr>      
                            
                            
                            
                            
                            
                            
                            <tr  id="printshow3">
                                <td align="center" class="newtd2" colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
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
    </form>
</body>
</html>