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
    public partial class Teacher : System.Web.UI.Page
    {

        Commanfnx fn = new Commanfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeachers();
            }
        }

        private void GetTeachers()
        {
            DataTable dt = fn.fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.NO],TeacherId,[Name],DOB,Gender,Mobile,
                                     Email,[Address],[Password] from Teacher");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue == "0")
                {
                    string email = txtEmail.Text.Trim();
                    DataTable dt = fn.fetch("select * from Teacher where Email='" + email + "'");
                    if (dt.Rows.Count > 0)
                    {
                        string query = "Insert into Teacher Values ('" + txtName.Text.Trim() + "','" + txtDoB.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + ddlGender.SelectedValue +
                            "','" + txtMobile.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + txtAdress.Text.Trim() + "','" + txtPassword.Text.Trim() + "')";
                        fn.Query(query);
                        lblMsg.Text = "Teacher Added Successfully";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty; 
                        txtEmail.Text = string.Empty;
                        txtAdress.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                        GetTeachers();
                    }
                    else
                    {
                        lblMsg.Text = "Entred <b> '"+email+"'</b> already exists !";
                        lblMsg.CssClass = "alert alert-danger";
                    }

                }
                else
                {
                    lblMsg.Text = "Gender is required !";
                    lblMsg.CssClass = "alert alert-danger";

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}