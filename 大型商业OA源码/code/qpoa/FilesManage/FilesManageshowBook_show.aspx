﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageshowBook_show.aspx.cs" Inherits="qpoa.FilesManage.FilesManageshowBook_show" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >


<head id="Head1" runat="server">
    <title>网络办公系统</title>
    <META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=0>
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
                       <td width="81%" valign="bottom"><a href="../main_d.aspx"  class="line_b">工作台</a> >> <a href="FilesManage.aspx"  class="line_b">案卷管理</a> >> 查看文件</td>
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
                                    <font class="shadow_but">案卷管理</font></button></td>
                            <td style="height: 26px" align="right" >  <a href="javascript:void(0)"><img src="../images/button_print.jpg" border= 0 onclick="printpage()"/></a></td>
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
                            width="100%"  id="tableprint">
                
                           <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    文件号：</td>
                                <td class="newtd2"  height="24" width="33%">
                                   
                                    <asp:Label ID="Num" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    文件主题词：</td>
                                <td class="newtd2"  height="24" width="35%">
                                
                                    <asp:Label ID="Name" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
     <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    文件标题：</td>
                                <td class="newtd2"  height="24" width="33%">
                                 
                                    <asp:Label ID="Title" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    文件辅标题：</td>
                                <td class="newtd2"  height="24" width="35%">
                                 
                                    <asp:Label ID="OtherTitle" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    发文单位：</td>
                                <td class="newtd2"  height="24" width="33%">
                                   
                                    <asp:Label ID="FwCompany" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    发文日期：</td>
                                <td class="newtd2"  height="24" width="35%">
                           
                                    <asp:Label ID="FwTime" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                            
                            <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    密级：</td>
                                <td class="newtd2"  height="24" width="33%">
                                    <asp:Label ID="Miji" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    紧急等级：</td>
                                <td class="newtd2"  height="24" width="35%">
                                    <asp:Label ID="Dengji" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                            
                            <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    文件分类：</td>
                                <td class="newtd2"  height="24" width="33%">
                                    <asp:Label ID="WjType" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    公文类别：</td>
                                <td class="newtd2"  height="24" width="35%">
                                    <asp:Label ID="GwType" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    文件页数：</td>
                                <td class="newtd2"  height="24" width="33%">
                                  
                                    <asp:Label ID="WjNum" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    打印页数：</td>
                                <td class="newtd2"  height="24" width="35%">
                                 
                                    <asp:Label ID="DyNum" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="17%">
                                    所属案卷：</td>
                                <td class="newtd2"  height="24" width="33%">
                                
                                    <asp:Label ID="FilesName" runat="server" Width="90%"></asp:Label></td>
                                <td align="right" class="newtd1"  height="24" nowrap="nowrap"
                                    width="15%">
                                    备注：</td>
                                <td class="newtd2"  height="24" width="35%">
                                
                                    <asp:Label ID="Remark" runat="server" Width="90%"></asp:Label></td>
                            </tr>
                            
                              <tr>
                                 <td class="newtd2"  colspan="4" height="17" style="text-align: center">
                                     <strong>文件附件</strong></td>
                            </tr>   
                           <tr  class="" id="nextrs22">
                                <td align="right" class="newtd1"  height="17" nowrap="nowrap"
                                    width="17%">
                                    附件列表：</td>
                                <td class="newtd2"  height="17" width="83%" colspan=3>
                                    <asp:Label ID="richeng" runat="server" Width="90%"></asp:Label></td>
                          
                            </tr>    
                            
                                                    
                          
                             <tr  id="printshow3">
                                <td align="center" class="newtd2"  colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
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
<asp:TextBox ID="QxUnitId" runat="server" Width="90%" style="DISPLAY: none"></asp:TextBox>
 
 <asp:TextBox ID="Number" runat="server" style="DISPLAY: none"></asp:TextBox>
    
    </form>
</body>
</html>