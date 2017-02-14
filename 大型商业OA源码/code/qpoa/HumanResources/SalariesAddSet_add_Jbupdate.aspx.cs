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
namespace qpoa.HumanResources
{
    public partial class SalariesAddSet_add_Jbupdate : System.Web.UI.Page
    {
        Db List = new Db();
        BindDrowDownList list = new BindDrowDownList();

        public static string fjkey;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] == null)
            {
                this.Response.Write("<script language=javascript>alert('登陆超时！');window.parent.location = '../main_d.aspx'</script>");
                return;

            }


            if (!IsPostBack)
            {
                string SQL_GetList = "select * from qp_SaXzPerson where id='" + List.GetFormatStr(Request.QueryString["id"]) + "'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {
                    Realname.Text = NewReader["Realname"].ToString();
                    Unit.Text = NewReader["Unit"].ToString();
                    JbMoney.Text = NewReader["JbMoney"].ToString();
                   
                }
                NewReader.Close();

                BindAttribute();


            }



        }

        public void BindAttribute()
        {
            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            string Sql_update = "Update qp_SaXzPerson  Set Realname='" + List.GetFormatStr(Realname.Text) + "',Unit='" + List.GetFormatStr(Unit.Text) + "',JbMoney='" + List.GetFormatStr(JbMoney.Text) + "' where id='" + int.Parse(Request.QueryString["id"]) + "'";
            List.ExeSql(Sql_update);

            InsertLog("修改人员薪资[" + Realname.Text + "]", "薪资录入");
            this.Response.Write("<script language=javascript>alert('提交成功！');opener.location=opener.location;window.close();</script>");
        }

        public void InsertLog(string Name, string MkName)
        {
            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                   + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);
        }








    }
}
