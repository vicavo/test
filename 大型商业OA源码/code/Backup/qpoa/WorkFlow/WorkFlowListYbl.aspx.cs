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
namespace qpoa.WorkFlow
{
    public partial class WorkFlowListYbl : System.Web.UI.Page
    {
        Db List = new Db();
        BindDrowDownList list = new BindDrowDownList();
        public static string CountsLabel, AllPageLabel, CurrentlyPageLabel, SqlStrStart, SqlStrMid, SqlStr, SqlStrStartCount, SqlStrCount;
        public string CreateMidSql()
        {
            string MidSql = string.Empty;
            if (Request.QueryString["key"] != null)
            {
                if (Request.QueryString["FormName"] != null)
                {
                    MidSql = MidSql + " and FormName like '%" + List.GetFormatStr(Server.UrlDecode(Request.QueryString["FormName"])) + "%'";
                }


                if (Request.QueryString["Name"] != null)
                {
                    MidSql = MidSql + " and Name like '%" + List.GetFormatStr(Server.UrlDecode(Request.QueryString["Name"])) + "%'";
                }

                if (Request.QueryString["NodeName"] != null)
                {
                    MidSql = MidSql + " and NodeName like '%" + List.GetFormatStr(Server.UrlDecode(Request.QueryString["NodeName"])) + "%'";
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
                BindAttribute();
                //DataBindToGridview("order by id desc");
                Bindquanxian();
                BindDroList();
            }

            if (FormName.SelectedValue == "0")
            {
                DataBindToGridview("order by id desc", "");

            }
            else
            {
                DataBindToGridview("order by id desc", "and FormId='" + FormName.SelectedValue + "'");
            }


        }

        public void Bindquanxian()
        {

            List.QuanXianVis(IMG1, "bbbb4b", Session["perstr"].ToString());
            List.QuanXianVis(GridView1, "bbbb4b", Session["perstr"].ToString());
        }

        public void BindAttribute()
        {
            btnFirst.Attributes["onclick"] = "javascript:return showwait();";
            btnPrev.Attributes["onclick"] = "javascript:return showwait();";
            btnNext.Attributes["onclick"] = "javascript:return showwait();";
            btnLast.Attributes["onclick"] = "javascript:return showwait();";
            Button1.Attributes["onclick"] = "javascript:return chkyema();";
        }
        public void BindDroList()
        {
            //附件列表
            string sql_down_bh = "select id,FormName from qp_DIYForm  order by id desc";
            if (!IsPostBack)
            {
                list.Bind_DropDownListFlow(FormName, sql_down_bh, "id", "FormName");
            }

        }

        public void DataBindToGridview(string Sqlsort, string sqlfrom)
        {


            SqlStrStart = "select * from qp_AddWorkFlow where  (CHARINDEX('," + this.Session["username"] + ",',','+YJBObjectId+',')   >   0 )   and 1=1";
            SqlStrStartCount = "select count(id) from qp_AddWorkFlow where (CHARINDEX('," + this.Session["username"] + ",',','+YJBObjectId+',')   >   0 )   and  1=1";




            SqlStrMid = string.Empty;
            SqlStrMid = CreateMidSql();
            SqlStr = SqlStrStart + SqlStrMid;//查询
            SqlStrCount = SqlStrStartCount + SqlStrMid;//查询个数

            if (Request.QueryString["key"] != null)
            {
                string SQL_GetList_xs = "" + SqlStr + " " + sqlfrom + " " + Sqlsort + "";
                GridView1.DataSource = List.GetGrid_Pages_not(SQL_GetList_xs);
                GridView1.DataBind();

                string SQL_GetCount = SqlStrCount;
                CountsLabel = "" + List.GetCount(SQL_GetCount) + "";

            }
            else
            {

                string SQL_GetCount = "select count(id) from  qp_AddWorkFlow  where  (CHARINDEX('," + this.Session["username"] + ",',','+YJBObjectId+',')   >   0 )  ";
                CountsLabel = "" + List.GetCount(SQL_GetCount) + "";
                string SQL_GetList_xs = "select * from qp_AddWorkFlow   where  (CHARINDEX('," + this.Session["username"] + ",',','+YJBObjectId+',')   >   0 )   " + sqlfrom + " " + Sqlsort + " ";
                GridView1.DataSource = List.GetGrid_Pages_not(SQL_GetList_xs);
                GridView1.DataBind();

            }



            AllPageLabel = Convert.ToString(GridView1.PageCount);
            CurrentlyPageLabel = Convert.ToString(((int)GridView1.PageIndex + 1));


            btnFirst.CommandName = "1";
            btnPrev.CommandName = (GridView1.PageIndex == 0 ? "1" : GridView1.PageIndex.ToString());

            btnNext.CommandName = (GridView1.PageCount == 1 ? GridView1.PageCount.ToString() : (GridView1.PageIndex + 2).ToString());
            btnLast.CommandName = GridView1.PageCount.ToString();
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataControlRowType itemType = e.Row.RowType;
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
                e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);";

            }



        }

        public void InsertLog(string Name, string MkName)
        {

            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                                      + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);

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


            //DataBindToGridview(sql);


            if (FormName.SelectedValue == "0")
            {
                DataBindToGridview(sql, "");

            }
            else
            {
                DataBindToGridview(sql, "and FormId='" + FormName.SelectedValue + "'");
            }
        }




        public override void VerifyRenderingInServerForm(Control control)
        { }

        protected void PagerButtonClick(object sender, EventArgs e)
        {
            try
            {
                GridView1.PageIndex = Convert.ToInt32(((LinkButton)sender).CommandName) - 1;
                //DataBindToGridview("order by id desc");

                if (FormName.SelectedValue == "0")
                {
                    DataBindToGridview("order by id desc", "");

                }
                else
                {
                    DataBindToGridview("order by id desc", "and FormId='" + FormName.SelectedValue + "'");
                }
            }
            catch
            {

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                if (GoPage.Text.Trim().ToString() == "")
                {
                    Response.Write("<script language='javascript'>alert('页码不可以为空!');</script>");
                }
                else if (GoPage.Text.Trim().ToString() == "0" || Convert.ToInt32(GoPage.Text.Trim().ToString()) > GridView1.PageCount)
                {
                    Response.Write("<script language='javascript'>alert('页码不是一个有效值!');</script>");
                }
                else if (GoPage.Text.Trim() != "")
                {
                    int PageI = Int32.Parse(GoPage.Text.Trim()) - 1;
                    if (PageI >= 0 && PageI < (GridView1.PageCount))
                    {
                        GridView1.PageIndex = PageI;
                    }
                }
                // DataBindToGridview("order by id desc");
                if (FormName.SelectedValue == "0")
                {
                    DataBindToGridview("order by id desc", "");

                }
                else
                {
                    DataBindToGridview("order by id desc", "and FormId='" + FormName.SelectedValue + "'");
                }
            }
            catch
            {
                //DataBindToGridview("order by id desc");
                if (FormName.SelectedValue == "0")
                {
                    DataBindToGridview("order by id desc", "");

                }
                else
                {
                    DataBindToGridview("order by id desc", "and FormId='" + FormName.SelectedValue + "'");
                }
                Response.Write("<script language='javascript'>alert('请输入有效的页码字符！');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WorkFlowList.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("WorkFlowListYbl.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("WorkFlowListYWt.aspx");
        }





    }
}
