﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowName_show.aspx.cs" Inherits="qpoa.WorkFlow.WorkFlowName_show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>网络办公系统</title>
        <LINK href="../css/public.css" type="text/css" rel="stylesheet">
         <LINK href="../css/style_oa_30.css" type="text/css" rel="stylesheet">
         <script>


function delf()
{
if (!confirm("是否确定删除文件夹？"))
return false;
}

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


function showfrom(str)
{
var num=Math.random();
window.open ("WorkFlowName_show_show.aspx?tmp="+num+"&id="+str+"", "_blank", "height=460, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
}

function updatefrom(str)
{
var num=Math.random();
window.open ("WorkFlowName_show_update.aspx?tmp="+num+"&id="+str+"", "_blank", "height=460, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
}


function addfrom()
{
var num=Math.random();
window.open ("WorkFlowName_show_add.aspx?tmp="+num+"&id=<%=Request.QueryString["FormId"] %>", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
}


function desfrom(aaaa)
{
var num=Math.random();
alert(aaaa);
//window.open ("WorkFlowName_show_add_node.aspx?tmp="+num+"&FlowNumber="+FlowNumber+"", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
}

function aaaa(FlowNumber)
{
alert(FlowNumber);
}
</script>
</head>
<body class="newbody">
    <form id="form1" runat="server">

    <!--#include file="../public/public.js"-->
  <!--#include file="../public/pleasewait.htm"-->
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35">
          <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="17" >
                        &nbsp;</td>
                    <td valign="top" >
                    	<table  cellSpacing="0" cellPadding="0" width="100%" border="0">
                            <tr>
                                <td valign="top">
                                    <font color=red>对应表单：<%=Namefile %></font></td>
                            </tr>
							<tr>
								<td vAlign="top">
                        <div id="Div1" class="mainDiv">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BackColor="#4D77B1" BorderColor="#4D77B1" BorderStyle="None"
                                BorderWidth="1px" CellPadding="3" CellSpacing="1" GridLines="None" 
                                OnRowDataBound="GridView1_RowDataBound" 
                                OnSorting="GridView1_Sorting" PageSize="12" Style="font-size: 12px" Width="100%" >
                                <PagerSettings Visible="False" />
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <Columns>
                                     <asp:TemplateField HeaderText="选择">
                                        <ItemStyle HorizontalAlign="Center" Wrap="True" Width="30px" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" HorizontalAlign="Center" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckSelect" runat="server" />
                                            <asp:Label ID="LabVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                Visible="False" Width="0px"></asp:Label>
                                             <asp:Label ID="LabNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FlowName") %>'
                                                Visible="False" Width="0px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle Wrap="True" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="流程名称" SortExpression="FlowName">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                        <ItemTemplate>
                                           <%# DataBinder.Eval(Container.DataItem, "FlowName") %>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign=Center />
                                    </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="允许流程监控人员" SortExpression="JkRealname">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "JkRealname") %>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="相关操作">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" Width="120px"/>
                                        <ItemTemplate>
                                            <asp:Label ID="WFNId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>' Visible=false></asp:Label>
                                            <asp:Label ID="FlowNumber" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FlowNumber")%>' Visible=false></asp:Label>
                                            <asp:Label ID="Label1" runat="server" ></asp:Label>
                                            <asp:Label ID="Label2" runat="server" ></asp:Label>
                                            <asp:Label ID="Label3" runat="server" ></asp:Label>
                                        </ItemTemplate>
                                        
                                        
                                        <ItemStyle Wrap="False" HorizontalAlign=Center Width="120px"/>
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
                      
                  
                        <table align="center" class="newtable" border="0" cellpadding="4" cellspacing="1"
                            width="100%" id="tableprint">
                
                            <tr>
                                <td align="right" class="newtd1" nowrap="nowrap"
                                    width="15%" style="height: 17px">
                                    流程操作：</td>
                                <td class="newtd2" colspan="3" width="85%" style="height: 17px">
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">删除选中文件</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server">新建工作流</asp:LinkButton>
                                    <asp:DropDownList ID="DIYForm" runat="server" Width="178px" Visible="False">
                                    </asp:DropDownList>
                                    <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" Visible="False">确定复制</asp:LinkButton></td>
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
                      <td valign="top" background="../images/next_bg.jpg">
                     
                          <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                  <td >
                                
                                  </td>
                                  <td >
                                                              <a href="javascript:void(0)" onclick="checkAll()" class="line">全选</a>
                                      &nbsp;&nbsp;<a href="javascript:void(0)" onclick="fanAll()" class="line">反选</a>&nbsp; <asp:LinkButton ID="btnFirst" runat="server" CssClass="line" CommandArgument="first" OnClick="PagerButtonClick">首页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnPrev" runat="server" CssClass="line" CommandArgument="prev" OnClick="PagerButtonClick">上一页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnNext" runat="server" CssClass="line" CommandArgument="next" OnClick="PagerButtonClick">下一页</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnLast" runat="server" CssClass="line" CommandArgument="last" OnClick="PagerButtonClick">尾页</asp:LinkButton>
                                  &nbsp;&nbsp;<font color="#000000">页码：<asp:TextBox ID="GoPage" runat="server" Width="25px"></asp:TextBox>
                                      <asp:Button ID="Button1" runat="server" CssClass="button_jdkd" Text="跳转" Width="36px"　Height="20px" OnClick="Button1_Click1" />
                                      &nbsp;&nbsp;共有<font color=red><%=CountsLabel%></font>条数据&nbsp;&nbsp;当前为第<font color=red><%=CurrentlyPageLabel%></font>页&nbsp; 共<font color=red><%=AllPageLabel%></font>页</font>
                         
                                  </td>
                              </tr>
                          </table>
                          </td>
                      <td width="17">
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
