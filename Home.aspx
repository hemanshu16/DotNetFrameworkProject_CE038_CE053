<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .head {
            text-align: center;
            display: block;
            margin: auto;
            width: 250px;
            font-size: 30px;
            margin: auto;
            color: black;
        }

        p {
            text-decoration: underline;
        }

        .auto-style1 {
            margin-top: 30px;
            border: 1px solid black;
            padding: 20px;
            width: fit-content;
            display: inline-block;
            margin-left: 470px;
            border: none;
            padding: 20px 40px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
        }

        .auto-style11 {
            border: 1px solid black;
            display: inline-block;
            padding: 20px 0px;
            line-height: 22px;
            width: 400px;
            margin-top: -50px;
        }

        .auto-style4 {
            margin-top: 30px;
            border: none;
            padding: 20px 40px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
        }

        .auto-style-top {
            background-color: white;
            border: none;
            letter-spacing: 1.25px;
            font-size: 17px;
            padding: 5px;
        }

        .auto-style-top1 {
            border: 1px solid black;
            margin-top: 15px;
            background-color: whitesmoke;
            letter-spacing: 1.25px;
            font-size: 17px;
            border-radius: 5px;
            padding: 5px 20px;
        }

            .auto-style-top1:hover {
                background-color: white;
                border: none;
                text-decoration: underline;
            }

        input {
            outline: none;
            border: none;
            border-bottom: 1px solid black;
            text-indent: 2px;
            padding: 3px;
            letter-spacing: 1.5px;
        }

        .auto-style-top:hover {
            color: blue;
        }

        .top-align-center {
            text-align: center;
        }

        table {
            width: fit-content;
        }

        td {
        }

        .auto-style13 {
            width: 213px;
        }

        .auto-style18 {
            height: 23px;
            width: 157px;
        }

        .auto-style22 {
            height: 23px;
            width: 109px;
        }

        .auto-style24 {
            width: 142px;
        }

        * {
            box-sizing: border-box;
        }

        .row {
            display: flex;
        }

        .hover1 {
            padding: 5px 15px;
            background-color: white;
            border: none;
            border-radius: 5px;
            box-shadow: rgb(38,57,77) 0px 5px 10px -10px;
        }

            .hover1:hover {
                box-shadow: rgb(38,57,77) 0px 10px 20px -10px;
            }
    </style>
</head>
<body>
    <div class="head">
        <p class="headp">My Poll</p>
    </div>
    <form id="form1" runat="server">
        <div>
            <div class="top-align-center">
                <asp:Button ID="btn_Login" runat="server" class="auto-style-top hover1" OnClick="Login_Panel_Visible" Text="Login" />
                &nbsp;
              <asp:Button ID="btn_Registration" runat="server" class="auto-style-top hover1" OnClick="registration_panel_visible" Text="Registration" />
            </div>

        </div>
        <asp:Panel ID="login_panel" runat="server">
            <center>
                <table class="auto-style4">
                    <tr>
                        <td id="login_username" aria-busy="False" class="auto-style18">Email Address</td>
                        <td class="auto-style22">
                            <asp:TextBox ID="Txt_Login_Username" runat="server" TextMode="Email" Width="119px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td id="login_password" class="auto-style18">Password</td>
                        <td class="auto-style22">
                            <asp:TextBox ID="Txt_Login_Password" runat="server" TextMode="Password" CausesValidation="True" Width="119px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
                    </tr>
                    </td> </tr>
                </table>
                <br />

            </center>
            <div class="top-align-center">
                <asp:Button ID="Login_Submit" Class="auto-style-top1 hover1" runat="server" AutoPostBack="True" OnClick="Validate_Login_Details" Text="Login" />

            </div>



        </asp:Panel>
        <asp:Panel ID="registration_Panel" runat="server" CssClass="auto-style19">

            <div class="row">
                <div class="column">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style24">
                                <asp:Label ID="Registration_username" runat="server" Text="Your Name"></asp:Label>
                            </td>
                            <td class="auto-style13">
                                <asp:TextBox ID="Txt_Registration_Username" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                                <asp:Label ID="Registration_email" runat="server" Text="Enter Your Email "></asp:Label>
                            </td>
                            <td class="auto-style13">
                                <asp:TextBox ID="Txt_Registration_Email" runat="server" TextMode="Email"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                                <asp:Label ID="Registration_password" runat="server" Text="Enter Password"></asp:Label>
                            </td>
                            <td class="auto-style13">
                                <asp:TextBox ID="Txt_Registration_Password" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                                <asp:Label ID="Registration_Confirm_Password" runat="server" Text="Confirm Password"></asp:Label>
                            </td>
                            <td class="auto-style13">
                                <asp:TextBox ID="Txt_Registration_Confirm_Password" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                </div>
                <div class="column">
                    </table>
                 <table class="auto-style11" style="border: none;">
                     <tr>
                         <td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegistration_Username" runat="server" ControlToValidate="Txt_Registration_Username" ErrorMessage="Username Not Be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:CustomValidator ID="CustomValidator_Registration_Email" runat="server" ControlToValidate="Txt_Registration_Email" ErrorMessage="Email is Already Exists" OnServerValidate="Email_Validation" ValidationGroup="Registration"></asp:CustomValidator>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator_Registration_Password" runat="server" ControlToValidate="Txt_Registration_Password" EnableClientScript="False" ErrorMessage="PassWord Should Contation At Least 1 Uppercase, 1 Lowercase, 1 Number, 1 Special Character" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:CustomValidator ID="CustomValidator_Registration_Confirm_Password" runat="server" ControlToValidate="Txt_Registration_Confirm_Password" ErrorMessage="Password And Confirm Not Matched" OnServerValidate="Confirm_Password_Validation" ValidationGroup="Registration"></asp:CustomValidator>
                         </td>
                     </tr>
                 </table>
                </div>
            </div>

            <div class="top-align-center">
                <asp:Button ID="Registration_Submit" runat="server" class="auto-style-top1 hover1" OnClick="Validate_Registration_Details" Text="Registration" />

            </div>
        </asp:Panel>
    </form>
</body>
</html>
