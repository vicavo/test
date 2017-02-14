﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarApply_dsp.aspx.cs" Inherits="qpoa.PublicAffairs.CarApply_dsp" %>



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
            var aw = 600;
            //控件高
            var ah = 270;
            //计算控件水平位置
            var al = (screen.width - aw)/2-100;
            //计算控件垂直位置
            var at = (screen.height - ah)/5;
            //内容管理
            var title = '车辆申请';
            var icon = 'smile';
            var cardID = '0';
            //输出提示框
            var div = document.createElement("div");
            div.id = "UploadChoose";
            div.innerHTML = '\
            <div style="background-color:#FFFFFF;position:absolute;top:'+at+'px;left:'+al+'px;width:'+aw+'px;height:'+ah+'px;border:2px solid #000000;text-align:left">\
                <div style="clear:both;background-color:#0099AA;line-height:25px;font-weight:bold;color:#FFFFFF;font-size:12px;padding-left:10px">'+title+'</div>\
                <div style="padding-top:30px;">\
               <div style="clear:both;text-align:center;margin-top:0px;padding-bottom:0px"><b>请输入查询条件，没有输入的项将不做处理</b></div>\
            <div style="clear:both;text-align:left;margin-top:10px;padding-bottom:10px">\
                    <br> &nbsp;&nbsp;&nbsp;车&nbsp;&nbsp;&nbsp;&nbsp;牌&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;：<input id="jsCarNum"  type="text"   style="width: 138px"/>&nbsp;司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：<input id="jsDrivers" type="text"   style="width: 142px"/>\
                       <br> &nbsp;&nbsp;&nbsp;用&nbsp;&nbsp;&nbsp;&nbsp;车&nbsp;&nbsp;&nbsp;&nbsp;人&nbsp;：<input id="jsCarpeople"  type="text"   style="width: 138px"/>&nbsp;用&nbsp;&nbsp;车&nbsp;&nbsp;部&nbsp;&nbsp;门：<input id="jsUnitName" type="text"   style="width: 142px"/>\
                        <br> &nbsp;&nbsp;&nbsp;目&nbsp;&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;：<input id="jsDestination"  type="text"   style="width: 138px"/>&nbsp;调&nbsp;&nbsp;&nbsp;&nbsp;度&nbsp;&nbsp;&nbsp;&nbsp;员&nbsp;：<input id="jsManagerName" type="text"   style="width: 142px"/>\
                        <br> &nbsp;&nbsp;&nbsp;使用开始时间：<input id="jsstartime"  type="text"   style="width: 138px"/>&nbsp;使用结束时间：<input id="jsendtime" type="text"   style="width: 142px"/>格式yyyy-mm-dd\
                     <div style="text-align:center;">\  <br><br> <input type="button" value="关闭" onclick="closeAlert(\'UploadChoose\');">\
                         <input type="button" value="查询" onclick="return chksearchstr();closeAlert(\'UploadChoose\');">\
                    </div></div>\
                </div>\
            </div>';
            document.body.appendChild(div);

    }



function chksearchstr()
{
    var midSql="";

    if(document.getElementById('jsCarNum').value!='')
    {
    midSql=midSql+"CarNum="+document.getElementById('jsCarNum').value+"";
    }
    if(document.getElementById('jsDrivers').value!='')
    {
    midSql=midSql+"&Drivers="+document.getElementById('jsDrivers').value+"";
    }  
    if(document.getElementById('jsCarpeople').value!='')
    {
    midSql=midSql+"&Carpeople="+document.getElementById('jsCarpeople').value+"";
    }    
    if(document.getElementById('jsUnitName').value!='')
    {
    midSql=midSql+"&UnitName="+document.getElementById('jsUnitName').value+"";
    }   
    if(document.getElementById('jsDestination').value!='')
    {
    midSql=midSql+"&Destination="+document.getElementById('jsDestination').value+"";
    }  
     if(document.getElementById('jsManagerName').value!='')
    {
    midSql=midSql+"&ManagerName="+document.getElementById('jsManagerName').value+"";
    }     
    

    if(document.getElementById('jsstartime').value!='')
    {
    var objRe = /^([0-9]){4,4}-([0-9]){1,2}-([0-9]){1,2}$/;
    if(!objRe.test(document.getElementById('jsstartime').value))
    {
    alert('日期格式不正确，请按照yyyy-mm-dd格式输入');

    return false;
    }  

     
    midSql=midSql+"&Startime="+document.getElementById('jsstartime').value+"";
    } 
        
     
         
    if(document.getElementById('jsendtime').value!='')
    {
    var objRe = /^([0-9]){4,4}-([0-9]){1,2}-([0-9]){1,2}$/;
    if(!objRe.test(document.getElementById('jsendtime').value))
    {
    alert('日期格式不正确，请按照yyyy-mm-dd格式输入');

    return false;
    }  

     
    midSql=midSql+"&Endtime="+document.getElementById('jsendtime').value+"";
    } 


   
    
    showwait();
    	
    window.location="CarApply_dsp.aspx?key=1&"+midSql+"";
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
window.open ("CarApply_dc.aspx?key=2&tmp="+num+"", "_blank", "height=1, width=1")
}	
function outexcels()
{
showwait();
var num=Math.random();
window.open ("CarApply_dc.aspx?key=2&tmp="+num+"&str=<%=SqlStrMid%>", "_blank", "height=1, width=1")
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
                      <td width="81%" valign="bottom"><a href="../main_d.aspx" class="line_b">工作台</a> >> 车辆申请</td>
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
  <button class="btn4off" onclick="javascript:window.location='CarApply.aspx';showwait();"type="button"><font class="shadow_but">全部记录</font></button>
   <button class="btn4on" onclick="javascript:window.location='CarApply_dsp.aspx';showwait();" type="button"><font class="shadow_but">待审批</font></button>
                                <button class="btn4off" onclick="javascript:window.location='CarApply_ytg.aspx';showwait();" type="button"><font class="shadow_but">已通过</font></button>
                               <button class="btn4off" onclick="javascript:window.location='CarApply_wtg.aspx';showwait();" type="button"><font class="shadow_but">未通过</font></button>
                                  <button class="btn4off" onclick="javascript:window.location='CarApply_syz.aspx';showwait();" type="button"><font class="shadow_but">使用中</font></button>
                               <button class="btn4off" onclick="javascript:window.location='CarApply_yjs.aspx';showwait();" type="button"><font class="shadow_but">已结束</font></button>                             
                            </td>
                              <td style="height: 26px" align="right" > 
                                  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/button_add.jpg"
                                      OnClick="ImageButton1_Click" />
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
                        <div id="Div1" >
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BackColor="#4D77B1" BorderColor="#4D77B1" BorderStyle="None"
                                BorderWidth="1px" CellPadding="5" CellSpacing="1" GridLines="None" 
                                OnRowDataBound="GridView1_RowDataBound" 
                                OnSorting="GridView1_Sorting" PageSize="12" Style="font-size: 12px" Width="100%" OnRowCommand="GridView1_RowCommand" >
                                <PagerSettings Visible="False" />
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <Columns>
                                    <asp:BoundField DataField="CarNum" HeaderText="车牌号" SortExpression="CarNum">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Destination" HeaderText="目的地" SortExpression="Destination">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>
                                    
                                   <asp:BoundField DataField="State" HeaderText="当前状态" SortExpression="State">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>     
                                   <asp:BoundField DataField="ManagerName" HeaderText="审批人" SortExpression="ManagerName">
                                        <ItemStyle Wrap="False" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                    </asp:BoundField>                                 
                                       <asp:TemplateField HeaderText="相关操作">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" Width="120px"/>
                                        <ItemTemplate>
                                            <a href='CarApply_show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id") %>' onclick="showwait();">查看</a>
                                        <a href='CarApply_update.aspx?keyback=2&id=<%# DataBinder.Eval(Container.DataItem, "id") %>' onclick="showwait();">修改</a>
                                      <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="ShanChu">删除</asp:LinkButton>
 
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
