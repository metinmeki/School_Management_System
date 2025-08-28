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
    public partial class TeachersSubject : System.Web.UI.Page
    {



        Commanfnx fn = new Commanfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void GetClass()
        {
            DataTable dt = fn.fetch("SELECT * FROM Class");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "ClassName";
            ddlSubject.DataValueField = "ClassId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Class");
        }

        private void GetTeacher()
        {
            DataTable dt = fn.fetch("SELECT * FROM Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "Name";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "Select Teacher");
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.fetch("SELECT * FROM Subject where ClassId='"+ classId +"'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "ClassName";
            ddlSubject.DataValueField = "ClassId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Class");
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}