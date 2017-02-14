﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using qpsmartweb.Public;
using System.IO;
namespace qpoa.MyAffairs
{
    public partial class Emailprv_add : System.Web.UI.Page
    {
        Db List = new Db();
        BindDrowDownList list = new BindDrowDownList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] == null)
            {
                this.Response.Write("<script language=javascript>alert('登陆超时！');window.parent.location = '../main_d.aspx'</script>");
                return;

            }

            if (!Page.IsPostBack)
            {
           
           
                BindAttribute();
            }

        }


        public void BindAttribute()
        {
    

            Button2.Attributes["onclick"] = "javascript:return showwait();";
            Button1.Attributes["onclick"] = "javascript:return chknull();";



        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Emailprv.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string sql_insert = "insert into qp_Emailprv   (EmailName,EmailAdd,EmailUserName,EmailPassword,Pop3,Smtp,ServerEmail,MainNet,Username,Realname) values ('" + List.GetFormatStr(EmailName.Text) + "','" + List.GetFormatStr(EmailAdd.Text) + "','" + List.GetFormatStr(EmailUserName.Text) + "','" + List.GetFormatStr(EmailPassword.Text) + "','" + List.GetFormatStr(Pop3.Text) + "','" + List.GetFormatStr(Smtp.Text) + "','" + List.GetFormatStr(ServerEmail.SelectedValue) + "','" + List.GetFormatStr(MainNet.Text) + "','" + Session["username"] + "','" + Session["realname"] + "')";
            List.ExeSql(sql_insert);
            //Response.Write(sql_insert);
            InsertLog("新增邮件参数[" + EmailName.Text + "]", "邮件参数设置");


            this.Response.Write("<script language=javascript>alert('提交成功！');window.location.href='Emailprv.aspx'</script>");


        }

        public void InsertLog(string Name, string MkName)
        {


            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

        }





    }
}
