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


namespace qpoa.ProManage
{
    public partial class ProManageJD_show : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                string SQL_GetList = "select * from qp_ProManageJD where id='" + List.GetFormatStr(Request.QueryString["id"]) + "'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {
                    XmName.Text = NewReader["XmName"].ToString();
                    Jieduan.Text = NewReader["Jieduan"].ToString();
                    Wanchenglv.Text = NewReader["Wanchenglv"].ToString();
                }
                NewReader.Close();
            }
        }
    }
}
