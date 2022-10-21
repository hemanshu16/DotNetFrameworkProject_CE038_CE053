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
    public partial class CreatePoll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Name"] == null)
            {
                Response.Redirect("~/Home.aspx?msg=Not Login");
            }
            int poll_id = Convert.ToInt32(Session["Poll_Id"]);
            if(Request.QueryString["Poll_Id"] != null)
            {
                poll_id = Convert.ToInt32(Request.QueryString["Poll_Id"]);
                Session["Poll_Id"] = poll_id;
            }
           
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection con = new SqlConnection();

                    con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                    String command = $"Select * from Polls Where id = '{poll_id}'";

                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        Txt_Create_Question.Text = rdr.GetString(3);
                        if(rdr.GetString(3).Contains("Enter Your Question"))
                        {
                            Txt_Create_Question.Text = "Enter Your Question";
                        }
                        String temp = rdr.GetDateTime(2).ToString();
                        String[] subs = temp.Split(' ');
                        String[] date_1 = subs[0].Split('/');
                        String date_2 = date_1[2] + "-" + date_1[1] + "-" + date_1[0] + "T";
                        String[] times = subs[1].Split(':');
                        int hour = Convert.ToInt32(times[0]);
                        if(subs[2] == "PM")
                        {
                            hour += 12;
                        }
                        String empty = "";
                        if(hour.ToString().Length == 1)
                        {
                            empty = "0";
                        }
                        date_2 = date_2 + empty +hour.ToString() + ":" + times[1];
                      
                        Txt_time.Text = date_2;
                        check_1.Checked = rdr.GetInt32(4) == 1 ? true : false;
                    }

                    //GridView1.DataSource = rdr;
                    //GridView1.DataBind();


                    rdr.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }

        }

        protected void Add_Option(object sender, EventArgs e)
        {
            try
            {   /*
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String query = "INSERT INTO Options (OPTION,COUNT,POLLID) VALUES(@OPTION1,@COUNT,@POLLID)";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@OPTION1", "hello");
                        cmd.Parameters.AddWithValue("@COUNT", "0");
                        cmd.Parameters.AddWithValue("@POLLID", Session["Poll_Id"]);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }*/
                SqlConnection con = new SqlConnection();
               
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;
                int poll_id = Convert.ToInt32(Session["Poll_Id"]);
                String query = "INSERT INTO Options (OPTION_NAME,COUNT,POLLID) VALUES(@USERID,@ENDTIME,@QUESTION)";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@USERID", Txt_new_option.Text);
                        cmd.Parameters.AddWithValue("@ENDTIME", '0');
                        cmd.Parameters.AddWithValue("@QUESTION", poll_id);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Add_poll(object sender, EventArgs e)
        {   
            int poll_id = Convert.ToInt32(Session["Poll_Id"]);
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;
               
                string multiple = "0";
                if(check_1.Checked)
                {
                    multiple = "1";
                }
                String query = "UPDATE Polls SET QUESTION = '" + Txt_Create_Question.Text +"', ENDTIME = '" +Txt_time.Text + ":00', Mulitple = '" + multiple + "'  where Id = " + Session["Poll_Id"]   ;
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }
                Response.Redirect("~/ManagePoll.aspx");
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}