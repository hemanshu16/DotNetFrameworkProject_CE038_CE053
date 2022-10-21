using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Diagnostics;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class ManagePoll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if(Session["Name"] != null)
            {
               username.Text = "Welcome " + Session["Email"] ;
            }
            else {
                Response.Redirect("~/Home.aspx?msg=Not Login");
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Home.aspx?msg=Do Login");
        }

        protected void Create_Poll_Redirect(object sender, EventArgs e)
        {
            
           
            string dat = DateTime.Now.ToString();
            Response.Write(dat + "\n");
            Guid myuuid = Guid.NewGuid();
           
            string question_id = "Enter Your Question " + myuuid.ToString();
              try
            {
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String query = "INSERT INTO POLLS (USERID,ENDTIME,QUESTION,Mulitple) VALUES(@USERID,@ENDTIME,@QUESTION,@MULTIPLE)";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@USERID", Session["Id"]);
                        cmd.Parameters.AddWithValue("@ENDTIME", DateTime.Now);
                        cmd.Parameters.AddWithValue("@QUESTION", question_id);
                        cmd.Parameters.AddWithValue("@MULTIPLE", "0");
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            try
            {
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String query = "SELECT ID FROM POLLS WHERE QUESTION = '" + question_id +"'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if(rdr.Read())
                {
                    Session["Poll_id"] = rdr.GetInt32(0).ToString();
                    Response.Redirect("~/CreatePoll.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }

    }
}
