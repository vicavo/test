﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalariesAddSet.aspx.cs" Inherits="qpoa.HumanResources.SalariesAddSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<script>
function chknull()
{
    if(document.getElementById('Name').value=='')
    {
    alert('薪资名称不能为空');
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
              薪资录入</td>
        </tr>
      </table>
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
            <div id="printshow2"> 
            </div>
            <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="17">
                        &nbsp;</td>
                    <td valign="top" >
                  
                        <table align="center" class="newtable" border="0" cellpadding="4" cellspacing="1"
                            width="100%">
                            <tr>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    帐套名称：</td>
                                <td class="newtd2" height="17" width="33%">
                                    <asp:DropDownList ID="SaName" runat="server" Width="90%">
                                </asp:DropDownList></td>
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    style="color: #000000" width="15%">
                                    薪资名称：</td>
                                <td class="newtd2" height="17" width="35%">

                                    <asp:TextBox ID="Name" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    对应年月：</td>
                                <td class="newtd2" colspan="3" height="24">
                                      <asp:DropDownList ID="DyYear" runat="server" Width="60px">
                                </asp:DropDownList>
                                    年<asp:DropDownList ID="DyMonth" runat="server" Width="60px">
                                </asp:DropDownList>月
                                      <script>SetNeed('BothDay')</script>

                                    </td>
                            </tr>
  
                                   
                      
                          
                             <tr  id="printshow3">
                                <td align="center" class="newtd2" colspan="4" height="26" width="33%">
                                    	<div align="center"><FONT face="宋体">
                                <asp:Button ID="Button4" runat="server" Text="保存并导入明细数据" CssClass="button_blue" OnClick="Button4_Click" />
                                            &nbsp; &nbsp;&nbsp;<input id="Button3" class="button_blue" onclick="javascript:window.close()"
                                                type="button" value="不保留关闭窗口" /></FONT></div> </td>
                            </tr>
                          
                        </table>
                        
           
                        
                    </td>
                    <td width="17" >
                        &nbsp;</td>
                </tr>
            </table>
          </td>
        </tr>
      </table>
              <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox></td>
  </tr>
</table>

    </form>
</body>
</html>