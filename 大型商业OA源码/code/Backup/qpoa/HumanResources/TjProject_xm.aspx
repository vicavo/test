﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TjProject_xm.aspx.cs" Inherits="qpoa.HumanResources.TjProject_xm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>网络办公系统</title>
        <LINK href="../css/public.css" type="text/css" rel="stylesheet">
         <LINK href="../css/style_oa_30.css" type="text/css" rel="stylesheet">
         <script>

function chkyema()
{
    if(document.getElementById('GoPage').value=='')
    {
    alert('页码不能为空');
    form1.GoPage.focus();
    return false;
    }	
   
    if(document.getElementById('GoPage').value!='')
    {
    var objRe = /^(0|[1-9]\d*)$/;
    if(!objRe.test(document.getElementById('GoPage').value))
    {
    alert('页码只能为数字');
    form1.GoPage.focus();
    return false;
    }
    }
   
    
    showwait();	
}  


</script>
</head>
<body class="newbody">
    <form id="form1" runat="server">

    <!--#include file="../public/public.js"-->
  <!--#include file="../public/pleasewait.htm"-->

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
          <div id="printshow1"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="17">&nbsp;</td>
                <td valign="top"> 
                <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="3%"><img src="../images/top_3.gif" ></td>
                      <td width="81%" valign="bottom"><a href="../main_d.aspx" class="line_b">工作台</a> >>  人力资源  >>  考勤统计  >>  考勤项目 >>  <%=Typename %></td>
                      <td width="16%">&nbsp;</td>
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
            </div></td>
        </tr>
      </table>
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
          <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="17" style="height: 40px">&nbsp;</td>
                <td valign="top" style="height: 40px"> 
                   <div id="printshow2"> <table align="center" background="../images/bg0003.gif" border="0" cellpadding="0"
                        cellspacing="0" width="100%">
                        <tr>
                            <td style="height: 26px; width: 11%;">
                              <button class="btn4off" type="button"><font class="shadow_but"><%=Typename %></font></button>
                             
                               
                            </td>
                              <td style="height: 26px" align="right" > 
                                  
                                  </td>
                        </tr>
                    </table>
                    </div>
                </td>
                <td width="17" style="height: 40px">&nbsp;</td>
              </tr>
            </table><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="17">
                        &nbsp;</td>
                    <td valign="top">
                    	<table  cellSpacing="0" cellPadding="0" width="100%" border="0">
                    	 <tr>
                                <td valign="top">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返  回" /></td>
                            </tr>
							<tr>
								<td vAlign="top">
                        <div id="Div1" class="mainDiv">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BackColor="#4D77B1" BorderColor="#4D77B1" BorderStyle="None"
                                BorderWidth="1px" CellPadding="5" CellSpacing="1" GridLines="None" 
                                OnRowDataBound="GridView1_RowDataBound" 
                                OnSorting="GridView1_Sorting" PageSize="12" Style="font-size: 12px" Width="100%" >
                                <PagerSettings Visible="False" />
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <Columns>
                                    <asp:BoundField DataField="Subject" HeaderText="事由" SortExpression="Subject">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="StartTime" HeaderText="开始时间" SortExpression="StartTime">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EndTime" HeaderText="结束时间" SortExpression="EndTime">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>
                                     <asp:TemplateField >
                                   　　　 <HeaderTemplate>
										<%=DiffTimeName%>
										</HeaderTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign=Center />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                        <ItemTemplate>
                                        	<%#DataBinder.Eval(Container.DataItem, "DiffTime")%>
                                       </ItemTemplate>
                                    </asp:TemplateField>   
                                    
                                    
                                      <asp:BoundField DataField="Realname" HeaderText="登记人" SortExpression="Realname">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>                                  
                                      <asp:TemplateField HeaderText="操作">
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Width="60px" />
                                        <ItemTemplate>
                                            <a href="TjProject_xm_show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID") %>&type=<%=Request.QueryString["Type"] %> ">查看</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <RowStyle BackColor="#FBFCFE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" Wrap="False" />
                                <AlternatingRowStyle BackColor="#E6EDF7" />
                                     <EmptyDataTemplate>
                                    <div align=center><font color=white>无相关数据！</font></div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            &nbsp;</div>
                            </td>
							</tr>
						</table>
                    </td>
                    <td width="17" >
                        &nbsp;</td>
                </tr>
            </table>
            
              <div id="printshow3">
              <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                      <td width="17" >
                          &nbsp;</td>
                      <td valign="top" background="../images/next_bg.jpg" >
                     
                          <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                  <td >
                                
                                  </td>
                                  <td >
                                                              &nbsp; <asp:LinkButton ID="btnFirst" runat="server" CssClass="line" CommandArgument="first" OnClick="PagerButtonClick">首页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnPrev" runat="server" CssClass="line" CommandArgument="prev" OnClick="PagerButtonClick">上一页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnNext" runat="server" CssClass="line" CommandArgument="next" OnClick="PagerButtonClick">下一页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnLast" runat="server" CssClass="line" CommandArgument="last" OnClick="PagerButtonClick">尾页</asp:LinkButton>
                                  &nbsp;&nbsp;&nbsp;<font color="#000000"> 页码：<asp:TextBox ID="GoPage" runat="server" Width="25px"></asp:TextBox>
                                      <asp:Button ID="Button1" runat="server" CssClass="button_jdkd" Text="跳转" Width="36px"　Height="20px" OnClick="Button1_Click1" />
                                      &nbsp;&nbsp;&nbsp;每页<font color=red>12</font>条数据
                                      &nbsp;&nbsp; 共有<font color=red><%=CountsLabel%></font>条数据
                                      &nbsp;&nbsp;&nbsp;当前为第<font color=red><%=CurrentlyPageLabel%></font>页 
                                      &nbsp;&nbsp;&nbsp; 共<font color=red><%=AllPageLabel%></font>页</font>
                         
                                  </td>
                              </tr>
                          </table>
                          </td>
                      <td width="17" >
                          &nbsp;</td>
                  </tr>
              </table>
              </div>
              
              
          </td>
        </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
