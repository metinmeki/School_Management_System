using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolMangmentSystem.Models.CommanFn;

namespace SchoolMangmentSystem.Admin
{
    public partial class ClassFees : System.Web.UI.Page
    {
        Commanfnx fn = new Commanfnx(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.fetch("SELECT * FROM Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0,"Select Class");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;

                DataTable dt = fn.fetch("SELECT * FROM Fees WHERE ClassId = '" + ddlClass.SelectedItem.Value + "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "INSERT INTO Fees (ClassId, FeesAmount) VALUES ('" + ddlClass.SelectedItem.Value + "', '" + txtFeeAmount.Text.Trim() + "')";
                    fn.Query(query);

                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";

                    ddlClass.SelectedIndex = 0;
                    txtFeeAmount.Text = String.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Entered Fees Already Exist for <b>" + classVal + "</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void GetFees()
        {
            DataTable dt = fn.fetch(@"SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [Sr.NO],
                              f.FeesId, f.ClassId, c.ClassName, f.FeesAmount
                              FROM Fees f INNER JOIN Class c ON c.ClassId = f.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void btnAdd_Click1(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetFees();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetFees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete From Fees Where FeesId = '"+feeId+"'");
                lblMsg.Text = "Fees Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.Message + "'')</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subjID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropwDownList1")).SelectedValue;
                string subjName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Subject Set ClassId = '"+classId+"', SubjectName= '"+ subjName+"' where SubjectId = '"+ subjID + "' ");
                lblMsg.Text = "Subject Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(''" + ex.Message + "'')</script>");
            }
        }
    }
}
