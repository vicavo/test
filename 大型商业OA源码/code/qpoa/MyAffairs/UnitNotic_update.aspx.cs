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
    public partial class UnitNotic_update : System.Web.UI.Page
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
            fjkey = Session["FjKey"].ToString();

            if (!IsPostBack)
            {

                BindDroList();
                BindAttribute();

                string SQL_GetList_sta = "select * from qp_UnitNotic where id='" + Request.QueryString["id"] + "' ";
                SqlDataReader NewReader = List.GetList(SQL_GetList_sta);
                if (NewReader.Read())
                {
                    Number.Text = NewReader["Number"].ToString();

                    d_content.Value = List.GetFormatStrbjq_show(NewReader["Content"].ToString());
                    Title.Text = NewReader["Title"].ToString();
                    UnitName.SelectedValue = NewReader["UnitNameId"].ToString();
                    IfShare.SelectedValue = NewReader["IfShare"].ToString();
                    if (NewReader["GxUnitNameId"].ToString() == "未公开")
                    {
                        GxUnitNameId.Text = "0";
                    }
                    else 
                    {
                        GxUnitNameId.Text = NewReader["GxUnitNameId"].ToString();
                    }
                    GxUnitName.Text = NewReader["GxUnitName"].ToString();
                
                }
                NewReader.Close();
            }


            BindFjlbList();
        }
        public void BindDroList()
        {
            //附件列表
            string sql_down_bh = "select id,Linew+name as aaa  from qp_UnitName order by QxString asc";
            list.Bind_DropDownList_nothing(UnitName, sql_down_bh, "id", "aaa");

        }


        public void BindAttribute()
        {
            GxUnitName.Attributes.Add("readonly", "readonly");
            Button2.Attributes["onclick"] = "javascript:return showwait();";
            Button1.Attributes["onclick"] = "javascript:return chknull();";


            Button4.Attributes["onclick"] = "javascript:return checkForm();";
            Button3.Attributes["onclick"] = "javascript:return delfj();";
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UnitNotic.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IfShare.SelectedValue == "只允许本部门查看")
            {
                string Sql_update = "Update qp_UnitNotic   Set Title='" + List.GetFormatStr(Title.Text) + "',Content='" + List.GetFormatStrbjq(d_content.Value) + "' ,UnitNameId='" + List.GetFormatStr(UnitName.SelectedValue) + "' ,UnitName='" + UnitName.SelectedItem.Text + "' ,IfShare='" + IfShare.SelectedValue + "' ,GxUnitNameId='未公开' ,GxUnitName='未公开'  where id='" + int.Parse(Request.QueryString["id"]) + "' ";
                List.ExeSql(Sql_update);
            }
            else
            {
                string Sql_update = "Update qp_UnitNotic   Set Title='" + List.GetFormatStr(Title.Text) + "',Content='" + List.GetFormatStrbjq(d_content.Value) + "' ,UnitNameId='" + List.GetFormatStr(UnitName.SelectedValue) + "' ,UnitName='" + UnitName.SelectedItem.Text + "' ,IfShare='" + IfShare.SelectedValue + "' ,GxUnitNameId='" + List.GetFormatStr(GxUnitNameId.Text) + "' ,GxUnitName='" + List.GetFormatStr(GxUnitName.Text) + "'  where id='" + int.Parse(Request.QueryString["id"]) + "' ";
                List.ExeSql(Sql_update);
            }

            InsertLog("修改部门通知[" + Title.Text + "]", "部门通知管理");
            this.Response.Write("<script language=javascript>alert('提交成功！');window.location.href='UnitNotic.aspx'</script>");
        }

        public void InsertLog(string Name, string MkName)
        {
            string sql_insert_log = "insert into qp_SystemLog (Name,MkName,Username,Realname,Nowtimes,Ip,Unit,UnitId,QxString) "
                        + "values ('" + Name + "','" + MkName + "','" + this.Session["username"] + "','" + this.Session["realname"] + "','" + System.DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "','" + this.Session["Unit"] + "','" + this.Session["UnitId"] + "','" + this.Session["QxString"] + "')";
            List.ExeSql(sql_insert_log);
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            //上传文件
            string strBaseLocation = Server.MapPath("UnitNotic/");
            string TruePath = string.Empty;
            string Temp1 = string.Empty;

            if (uploadFile.PostedFile.ContentLength != 0)
            {
                //获得文件全名
                string fileName = System.IO.Path.GetFileName(uploadFile.PostedFile.FileName);
                //获得扩展名
                string rightName = System.IO.Path.GetExtension(fileName);

                string str = Session["FjKey"].ToString();
                if (!List.StrIFInStr(rightName, str))
                {

                    this.Response.Write("<script language=javascript>alert('上传文件错误！允许上传格式为" + Session["FjKey"].ToString() + "');</script>");
                    return;

                }//如果没有包含，就提示错误


                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Temp1 = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;
                uploadFile.PostedFile.SaveAs(strBaseLocation + Temp1 + rightName);
                TruePath = Temp1 + rightName;  //获得随即文件名


                string sql_insert_file = "insert into qp_fileupload   (Name,NewName,KeyField) values ('" + fileName + "','MyAffairs/UnitNotic/" + TruePath + "','" + Number.Text + "')";
                List.ExeSql(sql_insert_file);


                InsertLog("上传附件[" + fileName + "]", "部门通知");
                BindFjlbList();
            }
        }


        public void BindFjlbList()
        {
            //附件列表
            string sql_down_1 = "select * from qp_fileupload where KeyField='" + Number.Text + "'";
            list.Bind_DropDownList_nothing(fjlb, sql_down_1, "NewName", "Name");
        }



    }
}
