using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolMangmentSystem.Models.CommanFn;

namespace SchoolMangmentSystem.Admin
{
    public partial class Subject : System.Web.UI.Page
    {
        Commanfnx fn = new Commanfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetSubject();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.fetch("SELECT * FROM Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;

                DataTable dt = fn.fetch("SELECT * FROM Subject WHERE ClassId = '" + ddlClass.SelectedItem.Value + 
                                        "', SubjectName='"+txtSubject.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "INSERT Into SubjectId  VALUES ('" + ddlClass.SelectedItem.Value + "', '" + txtSubject.Text.Trim() + "')";
                    fn.Query(query);

                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";

                    ddlClass.SelectedIndex = 0;
                    txtSubject.Text = String.Empty;
                    GetSubject();
                }
                else
                {
                    lblMsg.Text = "Entered Subject Already Exist for <b>" + classVal + "</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.fetch(@"SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [Sr.NO],
                              s.SubjectId, s.ClassId, c.ClassName,
                              FROM Subject s INNER JOIN Class c ON c.ClassId = s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void btnAdd_Click1(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();
        }

       

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetSubject();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string feesAmt = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees Set FeesAmount = '" + feesAmt.Trim() + "' where FeesId = '" + feeId + "' ");
                lblMsg.Text = "Fees Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.Message + "'')</script>");
            }
        }
    }
}
