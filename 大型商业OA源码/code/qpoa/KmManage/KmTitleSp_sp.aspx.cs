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
namespace qpoa.KmManage
{
    public partial class KmTitleSp_sp : System.Web.UI.Page
    {
        Db List = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] == null)
            {
                this.Response.Write("<script language=javascript>alert('登陆超时！');window.parent.location = '../main_d.aspx'</script>");
                return;

            }

            if (!Page.IsPostBack)
            {
                string SQL_GetList = "select * from qp_KmTitle where id='" + List.GetFormatStr(Request.QueryString["id"]) + "' and  State='等待审批'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {
                    Title.Text = NewReader["Title"].ToString();
                    Content.Text = NewReader["Content"].ToString();
                    State.Text = NewReader["State"].ToString();
                    Username.Text = NewReader["Username"].ToString();
                    Realname.Text = NewReader["Realname"].ToString();

                }
                NewReader.Close();

                BindAttribute();
            }



        }
        public void BindAttribute()
        {

            Button2.Attributes["onclick"] = "javascript:return showwait();";

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("KmTitleSp.aspx");
        }



        public void InsertLog(string Name, string MkName)
        {


            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Shenpi.SelectedValue == "通过")
            {
                string Sql_update1 = "Update qp_KmTitle    Set State='正常',SpTime='"+System.DateTime.Now.ToString()+"' where id='" + int.Parse(Request.QueryString["id"]) + "'";
                List.ExeSql(Sql_update1);

                string sql_insertgly = "insert into qp_Messages  (title,content,itimes,acceptusername,acceptrealname,sendusername,sendrealname,sfck,url,number) values ('您的知识[" + Title.Text + "]已经通过审批，请注意查看！','您的知识[" + Title.Text + "]已经通过审批，请注意查看！','" + System.DateTime.Now.ToString() + "','" + Username.Text + "','" + Realname.Text + "','系统消息','系统消息','否','KmManage/KmTitle.aspx','" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "')";
                List.ExeSql(sql_insertgly);

            }
            else
            {
                string Sql_update1 = "Update qp_KmTitle    Set State='禁止发布', SpTime='" + System.DateTime.Now.ToString() + "'  where id='" + int.Parse(Request.QueryString["id"]) + "'";
                List.ExeSql(Sql_update1);

                string sql_insertgly = "insert into qp_Messages  (title,content,itimes,acceptusername,acceptrealname,sendusername,sendrealname,sfck,url,number) values ('您的知识[" + Title.Text + "]拒绝审批，请注意查看！','您的知识[" + Title.Text + "]已经通过审批，请注意查看！','" + System.DateTime.Now.ToString() + "','" + Username.Text + "','" + Realname.Text + "','系统消息','系统消息','否','KmManage/KmTitle.aspx','" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "')"; 
                List.ExeSql(sql_insertgly);

            }

            InsertLog("审批[" + Title.Text + "]，[" + Shenpi.SelectedValue + "]", "知识审批");


            this.Response.Write("<script language=javascript>alert('提交成功！');window.location.href='KmTitleSp.aspx'</script>");
        }



    }
}
