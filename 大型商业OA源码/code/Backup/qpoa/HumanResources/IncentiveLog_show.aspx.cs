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
    public partial class IncentiveLog_show : System.Web.UI.Page
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
                string SQL_GetList = "select * from qp_IncentiveLog where id='" + List.GetFormatStr(Request.QueryString["id"]) + "'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {
                    StaffId.Text = NewReader["StaffId"].ToString();
                    StaffName.Text = NewReader["StaffName"].ToString();
                    Type.Text = NewReader["Type"].ToString();
                    Unit.Text = NewReader["UnitJc"].ToString();
                    SetTime.Text = System.DateTime.Parse(NewReader["SetTime"].ToString()).ToShortDateString();
                    JcNames.Text = List.TbToLb(NewReader["JcNames"].ToString());
                    Reasons.Text = List.TbToLb(NewReader["Reasons"].ToString());
                }
                NewReader.Close();
                BindAttribute();
            }
        }
        public void BindAttribute()
        {

          
          

        }
 

        public void InsertLog(string Name, string MkName)
        {


            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("IncentiveLog.aspx");
        }

    }
}
