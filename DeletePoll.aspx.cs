using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DeletePoll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] != null)
            {
              
                
            }
            else
            {
                Response.Redirect("~/Home.aspx?msg=Not Login");
            }
        }

        protected void delete_poll(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String query = "delete from options where PollId = @Id";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@Id", Request.QueryString["Id"]);
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

                String query = "delete from polls where Id = @ID";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@ID", Request.QueryString["Id"]);
                      
                        cmd.Connection = con;
                        con.Open();
                        int n = cmd.ExecuteNonQuery();
                        Response.Write("no of rows affected is " + n.ToString());
                        con.Close();

                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
          

            Response.Redirect("~/ManagePoll.aspx");
        }

        protected void go_back(object sender, EventArgs e)
        {
            Response.Redirect("~/ManagePoll.aspx");
        }
    }
}