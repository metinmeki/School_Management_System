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
            if (!IsPostBack) // ✅ إصلاح الشرط
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
            ddlClass.Items.Insert(0, new ListItem("Select Class", ""));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;
                string classId = ddlClass.SelectedItem.Value;

                DataTable dt = fn.fetch("SELECT * FROM Fees WHERE ClassId = '" + classId + "'");
                if (dt.Rows.Count == 0)
                {
                    string feeAmount = txtFeeAmount.Text.Trim();
                    string query = "INSERT INTO Fees (ClassId, FeeAmount) VALUES ('" + classId + "', '" + feeAmount + "')";
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
            DataTable dt = fn.fetch("SELECT * FROM Fees"); // ✅ إصلاح Form
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
