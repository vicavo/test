﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SealSp_sp.aspx.cs" Inherits="qpoa.SystemManage.SealSp_sp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >


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
                      <td width="3%" style="height: 24px"><img src="../images/top_3.gif" ></td>
                       <td width="81%" valign="bottom" style="height: 24px"><a href="../main_d.aspx"  class="line_b">工作台</a> >> <a href="SealSp.aspx"  class="line_b">
                           印章审批</a> >> 审批印章</td>
                      <td width="81%" style="height: 24px">&nbsp;</td>
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
                                    <font class="shadow_but">审批印章</font></button></td>
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
                                <td align="right" class="newtd1" nowrap="nowrap"
                                    width="15%" style="height: 17px">
                                    印章名称：</td>
                                <td class="newtd2" colspan="3" width="85%" style="height: 17px">
                                    <asp:Label ID="Name" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    印章类别：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:Label ID="YxType" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    印章状态：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:Label ID="State" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    印章使用人：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:Label ID="Realname" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    印章：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:Image ID="Newname" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="newtd2" colspan="4" height="17" style="text-align: center">
                                    <strong>印章审批</strong></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    是否通过审批：</td>
                                <td class="newtd2" colspan="3" height="17" width="85%">
                                    <asp:DropDownList ID="Shenpi" runat="server" Width="90%">
                                        <asp:ListItem>通过</asp:ListItem>
                                        <asp:ListItem>拒绝</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                              
                            <tr  id="printshow3">
                                <td align="center" class="newtd2" colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
                                <asp:Button ID="Button1" runat="server" Text="提 交" CssClass="button_blue" OnClick="Button1_Click" />
                                            <asp:Button ID="Button2" runat="server" Text="返 回" CssClass="button_blue" OnClick="Button2_Click" />
                             
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
  <asp:Label ID="Username" runat="server" Width="90%" Visible="False"></asp:Label>
    
    </form>
</body>
</html>