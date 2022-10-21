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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Request.QueryString["msg"] != null)
            {
                lbl_error.Text = Request.QueryString["msg"];
                //Request.QueryString.Remove("msg");
            }
            
               
            
            ViewState["error"] = "";
           
            if (ViewState["Panel"] != null)
            {
                if(ViewState["Panel"] == "Login")
                {
                    login_panel.Visible = true;
                    registration_Panel.Visible = false;
                }
                else if(ViewState["Panel"] == "Registration")
                {
                    registration_Panel.Visible = true;
                    login_panel.Visible = false;
                }
                
            }
            else
            {
                registration_Panel.Visible = false;
                login_panel.Visible = false;
            }
            ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
            myScriptResDef.Path = "~/Scripts/jquery-1.4.2.min.js";
            myScriptResDef.DebugPath = "~/Scripts/jquery-1.4.2.js";
            myScriptResDef.CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.4.2.min.js";
            myScriptResDef.CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.4.2.js";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, myScriptResDef);
        }

        protected void Validate_Login_Details(object sender, EventArgs e)
        {
            String username = Txt_Login_Username.Text;
            String Password = Txt_Login_Password.Text;
            ViewState["Panel"] = "Login";
            SqlConnection con = new SqlConnection();
           /* String[] arr= Request.Form.AllKeys;
            foreach(String s in arr)
            {
                Response.Write(s + "  ");
            }*/
            con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;
            try
            {
                String command = $"Select * from users Where Email = '{username}'";
                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if(rdr.Read())
                {
                    
                    if(rdr.GetString(3) == Password)
                    {
                        Session["Name"] = rdr.GetString(2);
                        Session["Email"] = rdr.GetString(1);
                        Session["Id"] = rdr.GetInt32(0).ToString();
                        Response.Redirect("~/ManagePoll.aspx");
                    }
                }
                
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            lbl_error.Text = "Enter Valid Credentials";

        }

      
        protected void Login_Panel_Visible(object sender, EventArgs e)
        {
            login_panel.Visible = true;
            registration_Panel.Visible = false;
            ViewState["Panel"] = "Login";
        }

        protected void registration_panel_visible(object sender, EventArgs e)
        {
            login_panel.Visible = false;
            registration_Panel.Visible = true;
            ViewState["Panel"] = "Registration";
        }

        protected void Validate_Registration_Details(object sender, EventArgs e)
        {

            Page.Validate("Registration");
            
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;
                try
                {
                    String query = "INSERT INTO USERS (NAME,EMAIL,PASSWORD) VALUES(@NAME,@EMAIL,@PASSWORD)";
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Parameters.AddWithValue("@NAME", Txt_Registration_Username.Text);
                            cmd.Parameters.AddWithValue("@EMAIL", Txt_Registration_Email.Text);
                            cmd.Parameters.AddWithValue("@PASSWORD", Txt_Registration_Password.Text);
                            cmd.Connection = con;
                            con.Open();
                            SqlDataReader rdr = cmd.ExecuteReader();
                            con.Close();
                            
                        }
                    }
                    ViewState["Panel"] = "Login";
                    Response.Write("<center><h3>Registration Done</h3></center>");
                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                


            }
            else
            {
               
                ViewState["Panel"] = "Registration";
            }
        }

      
        protected void Confirm_Password_Validation(object source, ServerValidateEventArgs args)
        {
            if(Txt_Registration_Password.Text == Txt_Registration_Confirm_Password.Text )
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Email_Validation(object source, ServerValidateEventArgs args)
        {
            try{
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userconnection"].ConnectionString;
                String command = $"Select * from users Where Email = '{Txt_Registration_Email.Text}'";
                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    args.IsValid = false;
                    return;
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            args.IsValid = true;
        }
    }
}