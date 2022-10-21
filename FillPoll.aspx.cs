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
    public partial class FillPoll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String command = $"Select * from Polls Where id = '{Request.QueryString["Poll_Id"]}'";

                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {

                    //  Txt_Create_Question.Text = rdr.GetString(3);
                    lbl_question.Text = rdr.GetString(3);
                    String temp = rdr.GetDateTime(2).ToString();
                    String[] subs = temp.Split(' ');
                    String[] date_1 = subs[0].Split('/');
                    String date_2 = date_1[2] + "-" + date_1[1] + "-" + date_1[0] + "T";
                    String[] times = subs[1].Split(':');
                    int hour = Convert.ToInt32(times[0]);
                    if (subs[2] == "PM")
                    {
                        hour += 12;
                    }
                    DateTime d = new DateTime(Convert.ToInt32(date_1[2]), Convert.ToInt32(date_1[1]), Convert.ToInt32(date_1[0]), hour, Convert.ToInt32(times[1]), 0);
                    DateTime current = DateTime.Now;
                    int diff = DateTime.Compare(d,current);
                    if(diff < 0)
                    {
                        panel_data.Visible = false;
                    }
                    else
                    {
                        
                        lbl_error.Visible = false;
                    }
                }

             

                rdr.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            try
            {
                SqlConnection con = new SqlConnection();

                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                String command = $"Select * from Polls Where id = '{Request.QueryString["Poll_Id"]}'";

                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {

                    if (rdr.GetInt32(4) == 0)
                    {
                        CheckBoxList1.Visible = false;
                    }
                    else
                    {
                        RadioButtonList1.Visible = false;
                    }
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

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Submit_Poll(object sender, EventArgs e)
        {
            String[] keys = Request.Form.AllKeys;
            int pre_count = -1;
            foreach (String key in keys)
            {
                Response.Write(key);
                String sub = key.Substring(0, 5);
                if (sub == "Check" || sub == "Radio")
                {
                    Response.Write(Request.Form[key] + " ");
                    try
                    { 
                        SqlConnection con = new SqlConnection();
                        con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                        String command = $"Select count from options Where Id = '{Request.Form[key]}'";
                        SqlCommand cmd = new SqlCommand(command, con);
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            pre_count = rdr.GetInt32(0);
                            pre_count += 1;
                           
                        }
                        Response.Write(pre_count + " pre count ");
                    }
                   
                    catch (Exception ex)
                    {
                        Response.Write("FIrst " + ex.Message);
                    }
                    try
                    {
                        SqlConnection con = new SqlConnection();
                        con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;

                        String query = "UPDATE OPTIONS SET Count = '" + pre_count.ToString() + "' where Id = " + Request.Form[key].ToString();
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
                        
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Second " + ex.Message);
                    }
                }
               
            }
            Response.Redirect("~/ViewResult.aspx?Poll_Id=" + Request.QueryString["Poll_Id"]);
        }
    }
}