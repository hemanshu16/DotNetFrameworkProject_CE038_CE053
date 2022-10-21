<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeletePoll.aspx.cs" Inherits="WebApplication1.DeletePoll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .auto-style {
            margin: auto;
            border: none;
            padding: 30px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            width: fit-content;
            background-color: white;
            width: fit-content;
            box-sizing: content-box;
        }

        .head {
            text-align: center;
            display: block;
            margin: auto;
            width: 250px;
            font-size: 30px;
            margin: auto;
            text-decoration: underline;
            color: black;
        }

        .auto-style2 {
            padding: 5px 15px;
            margin-bottom: 50px;
            background-color: white;
            border: none;
            border-radius: 5px;
            box-shadow: rgb(38,57,77) 0px 5px 10px -10px;
        }

            .auto-style2:hover {
                box-shadow: rgb(38,57,77) 0px 10px 20px -10px;
            }

        p {
            text-align: center;
        }

        .auto-style3 {
            height: 36px;
        }
    </style>
</head>
<body>
    <div class="head">
        <p class="headp">My Poll</p>
    </div>
    <form id="form1" runat="server">
        <div class="auto-style">
            <p>
                All Data of Poll is deleted along with result.
            </p>

            <p class="auto-style3">
                <asp:Button ID="btn_back" runat="server" OnClick="go_back" Text="Back" CssClass="auto-style2" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_delete" runat="server" OnClick="delete_poll" Text="Delete" CssClass="auto-style2" />
            </p>
        </div>
    </form>
</body>
</html>
