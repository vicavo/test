﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerOpenLxr.aspx.cs" Inherits="qpoa.SaleManage.CustomerOpenLxr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>网络办公系统</title>
        <LINK href="../css/public.css" type="text/css" rel="stylesheet">
         <LINK href="../css/style_oa_30.css" type="text/css" rel="stylesheet">
         <script>
   function UploadComplete()
    {

            showCover();
            //控件宽
            var aw = 500;
            //控件高
            var ah = 270;
            //计算控件水平位置
            var al = (screen.width - aw)/2;
            //计算控件垂直位置
            var at = (screen.height - ah)/5;
            //内容管理
            var title = '客户联系人信息查询';
            var icon = 'smile';
            var cardID = '0';
            //输出提示框
            var div = document.createElement("div");
            div.id = "UploadChoose";
            div.innerHTML = '\
            <div style="background-color:#FFFFFF;position:absolute;top:'+at+'px;left:'+al+'px;width:'+aw+'px;height:'+ah+'px;border:2px solid #000000;text-align:left">\
                <div style="clear:both;background-color:#0099AA;line-height:25px;font-weight:bold;color:#FFFFFF;font-size:12px;padding-left:10px">'+title+'</div>\
                <div style="padding-top:30px;">\
               <div style="clear:both;text-align:center;margin-top:0px;padding-bottom:0px"><b>此查询为组合查询，请输入查询条件，没有输入的项将不做处理</b></div>\
            <div style="clear:both;text-align:center;margin-top:10px;padding-bottom:10px">\
                      所属客户：<input id="jsname" type="text" />&nbsp;姓名：<input id="jskhrealname" type="text" />\
                         <br>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：<input id="jslxrPost" type="text" />&nbsp;性别：<input id="jssex" type="text" />\
                         <br><br> <input type="button" value="关闭" onclick="closeAlert(\'UploadChoose\');">\
                        <input type="button" value="查询" onclick="chksearchstr();closeAlert(\'UploadChoose\');">\
                    </div>\
                </div>\
            </div>';
            document.body.appendChild(div);

    }



function chksearchstr()
{
   
    var midSql="";

    if(document.getElementById('jsname').value!='')
    {
    midSql=midSql+"Name="+document.getElementById('jsname').value+"";
    }
    if(document.getElementById('jskhrealname').value!='')
    {
    midSql=midSql+"&KhRealname="+document.getElementById('jskhrealname').value+"";
    }  
    if(document.getElementById('jslxrPost').value!='')
    {
    midSql=midSql+"&LxrPost="+document.getElementById('jslxrPost').value+"";
    }    
    if(document.getElementById('jssex').value!='')
    {
    midSql=midSql+"&Sex="+document.getElementById('jssex').value+"";
    }   

    showwait();
    	
    window.location="CustomerOpenLxr.aspx?KeyId=<%=Request.QueryString["KeyId"]%>&key=1&"+midSql+"";
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


function outexcel()
{
showwait();
var num=Math.random();
window.open ("CustomerOpenLxr_dc.aspx?KeyId=<%=Request.QueryString["KeyId"] %>&tmp="+num+"", "_blank", "height=1, width=1")
}	
function outexcels()
{
showwait();
var num=Math.random();
window.open ("CustomerOpenLxr_dc.aspx?KeyId=<%=Request.QueryString["KeyId"] %>&tmp="+num+"&str=<%=SqlStrMid%>", "_blank", "height=1, width=1")
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
                      <td width="81%" valign="bottom"><a href="../main_d.aspx" class="line_b">工作台</a> >> <a href=Customer.aspx class="line_b">客户信息管理</a> >> 查看[<font color=red><%=KhRealnameShow%></font>]联系人信息</td>
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
                               <button class="btn4off" onclick="javascript:window.location='CustomerOpen_show.aspx?id=<%=Request.QueryString["KeyId"] %>';showwait();"
                                    type="button">
                                    <font class="shadow_but">客户信息</font></button>
                                <button class="btn4on" onclick="javascript:window.location='CustomerOpenLxr.aspx?KeyId=<%=Request.QueryString["KeyId"] %>';showwait();" type="button"><font class="shadow_but">联系人信息</font></button>
           
                            </td>
                              <td style="height: 26px" align="right" > 
                                  <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/images/button_show.jpg" OnClick="ImageButton6_Click" />
                                  <a href="javascript:void(0)"><img onclick="UploadComplete()" src="../images/button_search.jpg"  border=0 id="IMG1" runat="server"/></a>
                                  <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/button_out.jpg" />
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
                                             <asp:Label ID="LabNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "KhRealname") %>'
                                                Visible="False" Width="0px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle Wrap="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="KhRealname" HeaderText="联系人姓名" SortExpression="KhRealname">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" HorizontalAlign="Center" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="客户名称" SortExpression="Name">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LxrPost" HeaderText="职位" SortExpression="LxrPost">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" HorizontalAlign="Center" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MoveTel" HeaderText="手机" SortExpression="MoveTel">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" />
                                    </asp:BoundField>
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
                      <td valign="top" background="../images/next_bg.jpg">
                     
                          <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                  <td >
                                
                                  </td>
                                  <td >
                                                             &nbsp;&nbsp; <a href="javascript:void(0)" onclick="checkAll()" class="line">全选</a>
                                      &nbsp;&nbsp;<a href="javascript:void(0)" onclick="fanAll()" class="line">反选</a>
                                    &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="btnFirst" runat="server" CssClass="line" CommandArgument="first" OnClick="PagerButtonClick">首页</asp:LinkButton>
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
