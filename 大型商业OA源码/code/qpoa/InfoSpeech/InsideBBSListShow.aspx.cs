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
namespace qpoa.InfoSpeech
{
    public partial class InsideBBSListShow : System.Web.UI.Page
    {
        Db List = new Db();
        public static string CountsLabel, AllPageLabel, CurrentlyPageLabel, SqlStrStart, SqlStrMid, SqlStr, SqlStrStartCount, SqlStrCount, Name;
        public string CreateMidSql()
        {
            string MidSql = string.Empty;
            if (Request.QueryString["key"] != null)
            {
                if (Request.QueryString["Title"] != null)
                {
                    MidSql = MidSql + " and Title like '%" + List.GetFormatStr(Server.UrlDecode(Request.QueryString["Title"])) + "%'";
                }
            }
            return MidSql;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] == null)
            {
                this.Response.Write("<script language=javascript>alert('登陆超时！');window.parent.location = '../main_d.aspx'</script>");
                return;

            }

            if (!Page.IsPostBack)
            {
                
                DataBindToGridview("order by id asc");
                string SQL_GetList = "select * from qp_InsideBBS where id='" + List.GetFormatStr(Request.QueryString["id"]) + "'";
                SqlDataReader NewReader = List.GetList(SQL_GetList);
                if (NewReader.Read())
                {
                    Name = NewReader["Title"].ToString();
                }
                NewReader.Close();

                string Sql_update = "Update qp_InsideBBS  Set PointNum=PointNum+1  where id='" + int.Parse(Request.QueryString["id"]) + "'";
                List.ExeSql(Sql_update);

            }
        }


        public void DataBindToGridview(string Sqlsort)
        {
            string SQL_GetList_xs = "select * from qp_InsideBBS where id='" + List.GetFormatStr(Request.QueryString["id"]) + "' or ParentNodesID='" + List.GetFormatStr(Request.QueryString["id"]) + "' " + Sqlsort + "";
            GridView1.DataSource = List.GetGrid_Pages_not(SQL_GetList_xs);
          
            GridView1.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //DataControlRowType itemType = e.Row.RowType;
            //if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
            //    e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);";

            //}

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label ln2 = (Label)e.Row.FindControl("Lid2");
                Label ll2 = (Label)e.Row.FindControl("Label2");
                Label ll1 = (Label)e.Row.FindControl("Label1");
                ll2.Text = null; ll1.Text = null;

                string SQL_GetList1 = "select * from qp_InsideBBS where  id='" + ln2.Text + "' and Username='" + Session["username"] + "' ";
                SqlDataReader NewReader1 = List.GetList(SQL_GetList1);
                if (NewReader1.Read())
                {
                    ll2.Text = "[<a href=InsideBBSListShowBack.aspx?id=" + Request.QueryString["id"] + "&BigId=" + Request.QueryString["BigId"] + ">回复</a>][<a href=InsideBBSListShowBj.aspx?id=" + NewReader1["id"] + "&Backid=" + Request.QueryString["id"] + "&BigId=" + Request.QueryString["BigId"] + ">编辑</a>][<a href='javascript:void(0)' onclick='window.open (\"InsideBBSListShowDel.aspx?id=" + NewReader1["id"] + "&Backid=" + Request.QueryString["id"] + "&BigId=" + Request.QueryString["BigId"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")'>删除</a>]";
                }
                else
                {
                    ll2.Text = "[<a href=InsideBBSListShowBack.aspx?id=" + Request.QueryString["id"] + "&BigId=" + Request.QueryString["BigId"] + ">回复</a>]";

                }
                NewReader1.Close();



                string SQL_GetList7 = "select * from qp_InsideBBS where  id='" + ln2.Text + "' ";

              //  Response.Write("" + SQL_GetList7 + "<br>");

                SqlDataReader NewReader7 = List.GetList(SQL_GetList7);
                if (NewReader7.Read())
                {
                    ll1.Text = null;
                    string SQL_rc = "select  * from qp_fileupload where KeyField='" + NewReader7["Number"] + "' order by id desc";
                  //  Response.Write("" + SQL_rc + "<br>");
                    SqlDataReader NewReader_rc = List.GetList(SQL_rc);
                    ll1.Text += "<table width=100% border=0 cellspacing=0 cellpadding=4>";
                    ll1.Text += "<tr><td width=100% >";
                    while (NewReader_rc.Read())
                    {
                        ll1.Text += " ·<a href=../file_down.aspx?number=" + NewReader_rc["NewName"].ToString() + "  target=_blank>" + NewReader_rc["Name"].ToString() + "</a><br>";
                    }
                    ll1.Text += " </td></tr><TR></table>";
                    NewReader_rc.Close();

                }
                NewReader7.Close();
            }

        }



        public void InsertLog(string Name, string MkName)
        {


            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

        }


        protected void b1_Click(object sender, EventArgs e)
        {
            Response.Redirect("gridview_add.aspx");
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sql = "";

            if (ViewState["SortDirection"] == null || ViewState["SortDirection"].ToString().CompareTo("") == 0)
            {
                ViewState["SortDirection"] = " desc";
            }
            else
                ViewState["SortDirection"] = "";

            sql = " order by " + e.SortExpression + ViewState["SortDirection"];


            DataBindToGridview(sql);
        }





        public override void VerifyRenderingInServerForm(Control control)
        { }

        protected void PagerButtonClick(object sender, EventArgs e)
        {
            try
            {
                GridView1.PageIndex = Convert.ToInt32(((LinkButton)sender).CommandName) - 1;
                DataBindToGridview("order by id desc");
            }
            catch
            {
                Response.Write("<script language='javascript'>alert('没有这么多页！');</script>");
                return;
            }
        }

  

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsideBBSList.aspx?id=" + Request.QueryString["BigId"] + "");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataBindToGridview("order by id asc");
        }


    }
}
