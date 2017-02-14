﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCalendar.aspx.cs" Inherits="qpoa.MyAffairs.MyCalendar" %>



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
            var aw = 400;
            //控件高
            var ah = 270;
            //计算控件水平位置
            var al = (screen.width - aw)/2;
            //计算控件垂直位置
            var at = (screen.height - ah)/5;
            //内容管理
            var title = '我的日程';
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
                      &nbsp;&nbsp;&nbsp;事务时间：<input id="jsCalendarTime" type="text"  style="width: 208px"/>格式yyyy-mm-dd\
                      <br>&nbsp;&nbsp;&nbsp;事务内容：<input id="jsContent" type="text"  style="width: 208px"/>\
                       <br><br> <div style="text-align:center;"><input type="button" value="关闭" onclick="closeAlert(\'UploadChoose\');">\
                        <input type="button" value="查询" onclick="return chksearchstr();closeAlert(\'UploadChoose\');">\
                    </div></div>\
                </div>\
            </div>';
            document.body.appendChild(div);

    }



function chksearchstr()
{
    var midSql="";
    if(document.getElementById('jsContent').value!='')
    {
    midSql=midSql+"Content="+document.getElementById('jsContent').value+"";
    }
    
    if(document.getElementById('jsCalendarTime').value!='')
    {
    var objRe = /^([0-9]){4,4}-([0-9]){1,2}-([0-9]){1,2}$/;
    if(!objRe.test(document.getElementById('jsCalendarTime').value))
    {
    alert('日期格式不正确，请按照yyyy-mm-dd格式输入');

    return false;
    }  
      midSql=midSql+"CalendarTime="+document.getElementById('jsCalendarTime').value+"";
    } 


   showwait();	
   window.location="MyCalendarLb.aspx?key=1&"+midSql+"";
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
      <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0" id="TABLE1">
        <tr> 
          <td height="35">
          <div id="printshow1"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="17">&nbsp;</td>
                <td valign="top"> 
                <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="3%"><img src="../images/top_3.gif" ></td>
                      <td width="81%" valign="bottom"><a href="../main_d.aspx" class="line_b">工作台</a> >> 日程安排</td>
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
                              <button class="btn4on" onclick="javascript:window.location='MyCalendar.aspx';showwait();"
                                    type="button">
                                    <font class="shadow_but">日历模式</font></button>
                              
                             <button class="btn4off" onclick="javascript:window.location='MyCalendarLb.aspx';showwait();"
                                    type="button"><font class="shadow_but">列表模式</font></button> 
                              
                            </td>
                              <td style="height: 26px" align="right" > 
                                 
                             
                                  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/button_add.jpg" OnClick="ImageButton1_Click" />
                                  <a href="javascript:void(0)"><img onclick="UploadComplete()" src="../images/button_search.jpg"  border=0 id="IMG1" runat="server"/></a>
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
                        <div id="Div1">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black"
                                CellPadding="4" FirstDayOfWeek="Monday" ForeColor="Black" Height="320px" NextPrevFormat="ShortMonth"
                                OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"
                                ShowGridLines="True" Width="100%">
                                <DayStyle BorderWidth="1px" />
                                <DayHeaderStyle BackColor="Gainsboro" BorderWidth="1px" />
                                <TitleStyle BorderWidth="1px" />
                            </asp:Calendar>
                            &nbsp;</div>
                            </td>
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
	<script type="text/javascript">
	    parent.closeAlert('UploadChoose');
	</script>
    </form>
</body>
</html>
