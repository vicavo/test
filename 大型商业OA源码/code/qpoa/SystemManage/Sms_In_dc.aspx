﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sms_In_dc.aspx.cs" Inherits="qpoa.SystemManage.Sms_In_dc"  EnableEventValidation = "false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView style="FONT-SIZE: 12px" id="GridView1" runat="server" Width="100%" PageSize="12" CellSpacing="2" CellPadding="4" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999" BackColor="#CCCCCC" AutoGenerateColumns="False" AllowSorting="True" ForeColor="Black">
                                <PagerSettings Visible="False"  />
                                <FooterStyle BackColor="#CCCCCC"  />
                                <Columns>
                                       <asp:BoundField DataField="mbno" HeaderText="来信手机号">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" HorizontalAlign="Center" Wrap="False" />
                                         <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Msg" HeaderText="短信内容">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" HorizontalAlign="Center" Wrap="False" />
                                         <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ArriveTime" HeaderText="收信时间">
                                        <HeaderStyle CssClass="newtitle" ForeColor="white" Wrap="False" />
                                         <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                                <RowStyle BackColor="White"  />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"  />
                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"  />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Wrap="False"  />
                                     <EmptyDataTemplate>
                                    <div align=center><font color=white>无相关数据！</font></div>
                                </EmptyDataTemplate>
                            </asp:GridView>
    </div>
    </form>
</body>
</html>
