﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookManage_update.aspx.cs" Inherits="qpoa.PublicAffairs.BookManage_update" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<script>
function chknull()
{
  if(document.getElementById('Name').value=='')
    {
    alert('名称不能为空');
    form1.Name.focus();
    return false;
    }	



    showwait();					
}

var  wName3;  
function  OpenSaleData3()  
{  

var num=Math.random();
var str=document.getElementById("Type").value;
wName3=window.showModalDialog("../OpenWindows/open_Bookype.aspx?tmp="+num+"&requeststr="+str+"","window", "dialogWidth:400px;DialogHeight=480px;status:no;scroll=yes;help:no");               
if(wName3!=null && wName3!= "undefined")
{
document.getElementById("Type").value=wName3; 
}

}

</script>












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
                       <td width="81%" valign="bottom"><a href="../main_d.aspx"  class="line_b">工作台</a> >> <a href="BookManage.aspx"  class="line_b">图书信息管理</a> >> 修改图书</td>
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
                                    <font class="shadow_but">图书管理</font></button></td>
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
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="15%">
                                    图书名称：</td>
                                <td class="newtd2" height="17" colspan="3" width="85%">
                                    <asp:TextBox ID="Name" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>
                            
                           <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    所属部门：</td>
                                <td class="newtd2" height="24" width="33%">
                                    <asp:DropDownList ID="UnitName" runat="server" Width="95%">
                                    </asp:DropDownList></td>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                    图书类别：</td>
                                <td class="newtd2" height="24" width="35%">
                                    <asp:TextBox ID="Type" runat="server" Width="85%"></asp:TextBox>
                                      <A href="javascript:void(0)"><IMG onclick="OpenSaleData3()" src="../images/FDJ.gif" border="0"></A>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    图书作者：</td>
                                <td class="newtd2" height="24" width="33%">
                                    <asp:TextBox ID="Author" runat="server" Width="95%"></asp:TextBox></td>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                    ISBN号：</td>
                                <td class="newtd2" height="24" width="35%">
                                    <asp:TextBox ID="ISBN" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>                           

                            <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    出版社：</td>
                                <td class="newtd2" height="24" width="33%">
                                    <asp:TextBox ID="Publisher" runat="server" Width="95%"></asp:TextBox></td>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                    出版日期：</td>
                                <td class="newtd2" height="24" width="35%">
                                    
                                    <asp:TextBox ID="PublisherDate" runat="server" Width="85%" ></asp:TextBox>
                                    <script>SetNeed('PublisherDate')</script>
                                      <A href="javascript:void(0)"><IMG id="PublisherDate_HelpButton" onclick="Jscript:var sID ;sID = event.srcElement.id; sID = sID.substring(0,sID.lastIndexOf('_HelpButton'));DateSelect(sID);"
																		src="../images/FDJ.gif" border="0"></A>  
                                    
                                </td>
                            </tr> 


                               <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    存放地点：</td>
                                <td class="newtd2" height="24" width="33%">
                                    <asp:TextBox ID="Storage" runat="server" Width="95%"></asp:TextBox></td>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                   数量：</td>
                                <td class="newtd2" height="24" width="35%">
                                    <asp:TextBox ID="Number" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>              
               
                                <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="17%">
                                    价格：</td>
                                <td class="newtd2" height="24" width="33%">
                                    <asp:TextBox ID="Price" runat="server" Width="95%"></asp:TextBox></td>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                    借阅状态：</td>
                                <td class="newtd2" height="24" width="35%">
                                    <asp:DropDownList ID="Status" runat="server" Width="95%">
                                        <asp:ListItem>未借出</asp:ListItem>
                                        <asp:ListItem>已借出</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>             
               
               
                            

                            <tr>
                                <td align="right" class="newtd1" height="24" nowrap="nowrap"
                                    width="15%">
                                    借阅范围：</td>
                                <td class="newtd2" height="24" width="85%"  colspan=3>
                                    <asp:TextBox ID="LendingName" runat="server" Height="34px" TextMode="MultiLine" Width="85%"></asp:TextBox><A href="javascript:void(0)"><IMG onclick="openunit()" src="../images/FDJ.gif" border="0"></A></td>
                               
                            </tr>
                          
                            <tr>
                                <td align="right" class="newtd1" nowrap="nowrap"
                                    width="17%" style="height: 17px">
                                    借阅人：</td>
                                <td class="newtd2" colspan="3" style="height: 17px">
                                    <asp:TextBox ID="Borrowers" runat="server" Width="95%"></asp:TextBox></td>
                            </tr>
                       
                            <tr  class="" id="Tr1">
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    内容简介：</td>
                                <td class="newtd2" height="17" width="33%" colspan=3>
                                    <asp:TextBox ID="Introduction" runat="server" Width="95%" Height="78px" TextMode="MultiLine"></asp:TextBox></td>
                          
                            </tr>             
                            
                            
                            <tr  class="" id="Tr2">
                                <td align="right" class="newtd1" height="17" nowrap="nowrap"
                                    width="17%">
                                    备注：</td>
                                <td class="newtd2" height="17" width="33%" colspan=3>
                                    <asp:TextBox ID="Remark" runat="server" Width="95%" Height="78px" TextMode="MultiLine"></asp:TextBox></td>
                          
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
<asp:TextBox ID="LendingID" runat="server" Width="90%" style="DISPLAY: none"></asp:TextBox>
  


    


    
<script language="javascript">	



var  wName_2;  
function  openunit()  
{  
var num=Math.random();
var str=""+document.getElementById('LendingID').value+"";
wName_2=window.showModalDialog("../OpenWindows/open_UnitName_list.aspx?tmp="+num+"&requeststr="+str+"","window", "dialogWidth:650px;DialogHeight=580px;status:no;scroll=yes;help:no");                
var arr = wName_2.split("|");
for(var i=0;i<arr.length;i++)
{ 
document.getElementById("LendingID").value=arr[0]; 
document.getElementById("LendingName").value=arr[1]; 
}
}


</script>    

    
    </form>
</body>
</html>