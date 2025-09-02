using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolMangmentSystem.Models.CommanFn;

namespace SchoolMangmentSystem.Admin
{
    public partial class TeachersSubject : System.Web.UI.Page
    {
        // ✅ Object for database operations
        Commanfnx fn = new Commanfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetTeacher();
                GetTeacherSubject();

                // Default option for Subject
                ddlSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
            }
        }

        // ✅ Load all classes
        private void GetClass()
        {
            DataTable dt = fn.fetch("SELECT * FROM Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, new ListItem("Select Class", "0"));
        }

        // ✅ Load all teachers
        private void GetTeacher()
        {
            DataTable dt = fn.fetch("SELECT * FROM Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "Name";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, new ListItem("Select Teacher", "0"));
        }

        // ✅ Load all Teacher-Subject-Class relationships
        private void GetTeacherSubject()
        {
            DataTable dt = fn.fetch(@"
                SELECT 
                    Row_Number() OVER (Order By (Select 1)) as [SrNo], 
                    ts.Id, 
                    ts.ClassId, 
                    c.ClassName, 
                    ts.SubjectId, 
                    s.SubjectName, 
                    ts.TeacherId, 
                    t.Name as TeacherName
                FROM TeacherSubject ts
                INNER JOIN Class c ON ts.ClassId = c.ClassId
                INNER JOIN Subject s ON ts.SubjectId = s.SubjectId
                INNER JOIN Teacher t ON ts.TeacherId = t.TeacherId
            ");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        // ✅ When class changes → load subjects
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;

            // Load subjects by ClassId
            DataTable dt = fn.fetch("SELECT * FROM Subject WHERE ClassId='" + classId + "'");

            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();

            ddlSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
        }

        // ✅ Add Teacher-Subject-Class relationship
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string teacherId = ddlTeacher.SelectedValue;

                if (classId == "0" || subjectId == "0" || teacherId == "0")
                {
                    lblMsg.Text = "Please select Class, Subject and Teacher!";
                    lblMsg.CssClass = "alert alert-danger";
                    return;
                }

                DataTable dt = fn.fetch($@"
                    SELECT * FROM TeacherSubject 
                    WHERE ClassId='{classId}' 
                    AND SubjectId='{subjectId}' 
                    AND TeacherId='{teacherId}'
                ");

                if (dt.Rows.Count == 0)
                {
                    string query = $@"
                        INSERT INTO TeacherSubject (ClassId, SubjectId, TeacherId) 
                        VALUES ('{classId}', '{subjectId}', '{teacherId}')
                    ";

                    fn.Query(query);

                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";

                    // Reset form
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.Items.Clear();
                    ddlSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
                    ddlTeacher.SelectedIndex = 0;

                    GetTeacherSubject();
                }
                else
                {
                    lblMsg.Text = "This teacher is already assigned to this subject!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        // ✅ Paging
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeacherSubject();
        }

        // ✅ Editing
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeacherSubject();
        }

        // ✅ Updating
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string classId = (row.FindControl("ddlEditClass") as DropDownList).SelectedValue;
            string subjectId = (row.FindControl("ddlEditSubject") as DropDownList).SelectedValue;
            string teacherId = (row.FindControl("ddlEditTeacher") as DropDownList).SelectedValue;

            string query = $@"
                UPDATE TeacherSubject 
                SET ClassId='{classId}', SubjectId='{subjectId}', TeacherId='{teacherId}' 
                WHERE Id='{id}'
            ";

            fn.Query(query);

            GridView1.EditIndex = -1;
            GetTeacherSubject();

            lblMsg.Text = "Updated Successfully!";
            lblMsg.CssClass = "alert alert-success";
        }

        // ✅ After update
        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            lblMsg.Text = "Row updated successfully!";
            lblMsg.CssClass = "alert alert-success";
        }

        // ✅ Cancel edit
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacherSubject();
        }

        // ✅ RowCommand (optional for custom commands)
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        // ✅ Deleting (needs implementation if required)
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int teacherSubject = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete From teacherSubject Where Id = '" + teacherSubject + "'");
                lblMsg.Text = "Teacher Subject Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeacherSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.Message + "'')</script>");
            }
        }
    }
}
