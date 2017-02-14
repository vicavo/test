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
namespace qpoa.SaleManage
{
    public partial class SaleData_updateaspx : System.Web.UI.Page
    {
        Db List = new Db();
        public static string type, typename;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] == null)
            {
                this.Response.Write("<script language=javascript>alert('登陆超时！');window.parent.location = '../main_d.aspx'</script>");
                return;

            }

            if (!Page.IsPostBack)
            {
                type = Request.QueryString["type"].ToString();
                if (type == "1")
                {
                    typename = "区域维护";
                }

                if (type == "2")
                {
                    typename = "行业维护";
                }

                if (type == "3")
                {
                    typename = "客户来源";
                }

                if (type == "4")
                {
                    typename = "重要度";
                }

                if (type == "5")
                {
                    typename = "交往方式";
                }

                if (type == "6")
                {
                    typename = "企业性质";
                }

                if (type == "7")
                {
                    typename = "销售方式";
                }

                if (type == "8")
                {
                    typename = "服务方式";
                }
                if (type == "9")
                {
                    typename = "计量单位";
                }

                if (type == "10")
                {
                    typename = "产品类别";
                }
                if (type == "11")
                {
                    typename = "合同类型";
                }
                string SQL_GetList = "select * from qp_SaleData where id='" + List.GetFormatStr(Request.QueryString["id"]) + "'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {

                    Name.Text = NewReader["name"].ToString();




                }
                NewReader.Close();
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
            Response.Redirect("SaleData.aspx?type=" + type + "");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string Sql_update = "Update qp_SaleData  Set Name='" + List.GetFormatStr(Name.Text) + "'  where id='" + int.Parse(Request.QueryString["id"]) + "'";
            List.ExeSql(Sql_update);

            InsertLog("修改数据字典[" + List.GetFormatStr(Name.Text) + "]", "销售管理-基础数据字典-" + typename + "");


            this.Response.Write("<script language=javascript>alert('提交成功！');window.location.href='SaleData.aspx?type=" + Request.QueryString["type"].ToString() + "'</script>");


        }

        public void InsertLog(string Name, string MkName)
        {


            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

        }



    }
}
