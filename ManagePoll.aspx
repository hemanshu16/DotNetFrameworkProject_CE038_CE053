<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePoll.aspx.cs" Inherits="WebApplication1.ManagePoll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .auto-style1 {
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            width: 1074px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            width: fit-content;
            background-color: white;
            padding: 35px 80px;
        }

        table {
            border-collapse: collapse;
        }

        body {
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

        .auto-style {
            text-align: center;
        }

        button {
            padding: 5px 15px;
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

        .user {
            position: absolute;
            left: 15%;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="head">
        <p class="headp">My Poll</p>
    </div>
    <form id="form1" runat="server">
        <br />
        <div class="auto-style">

            <asp:Label ID="username" runat="server" Text="Label" CssClass="user"></asp:Label>

            <asp:Button ID="Btn_Create_Poll" runat="server" OnClick="Create_Poll_Redirect" Text="Create_Poll" CssClass="auto-style2" />
            &nbsp;&nbsp;&nbsp
        <asp:Button ID="btn_Logout" runat="server" OnClick="Logout" Text="Logout" CssClass="auto-style2" />
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" ViewStateMode="Disabled" CellPadding="10" CssClass="auto-style1" CellSpacing="5" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                <asp:BoundField DataField="Mulitple" HeaderText="Mulitple" SortExpression="Mulitple" />
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="DeletePoll.aspx?Id={0}" Text="Delete" HeaderText="Delete" Target="_self" />
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="CreatePoll.aspx?Poll_Id={0}" Text="Update" HeaderText="Update" Target="_self" />
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="FillPoll.aspx?Poll_Id={0}" HeaderText="View_Poll" Text="Share" Target="_blank" />
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="ViewResult.aspx?Poll_Id={0}" HeaderText="VIew Result" Text="Result" Target="_blank" />
            </Columns>
        </asp:GridView>
        &nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Polls] WHERE ([UserId] = @UserId)">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
