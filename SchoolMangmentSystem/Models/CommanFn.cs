using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SchoolMangmentSystem.Models
{
    public class CommanFn
    {
        public class Commanfnx
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolCS"].ConnectionString);
            public void Query(string query)
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd= new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();   
            }
            public DataTable fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }
        }
    }
}