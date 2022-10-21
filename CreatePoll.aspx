<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePoll.aspx.cs" Inherits="WebApplication1.CreatePoll" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', 'Geneva', 'Verdana', 'sans-serif';
        }

        .head {
            text-align: center;
            display: block;
            width: 250px;
            font-size: 30px;
            margin: auto;
            color: black;
        }

        .headp {
            text-decoration: underline;
        }

        .auto-style1 {
            margin: auto;
            border: none;
            padding: 30px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            width: fit-content;
            background-color: white;
            width: fit-content;
        }

        .auto-style3 {
            width: 308px;
        }

        .questionc {
            font-size: 15px;
            text-indent: 10px;
        }

        .auto-style4 {
            width: 218px;
        }

        .auto-style5 {
            margin: auto;
            border: 1px solid black;
            width: fit-content;
            padding: 10px;
        }

        .questionc1 {
            margin-left: 500px;
        }

        body {
        }

        .auto-style2 {
            margin: auto;
            border: none;
            padding: 30px;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            width: fit-content;
            background-color: white;
        }

        .auto-style5 {
            border-collapse: collapse;
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
    <br />
    <div class="head">
        <p class="headp">My Poll</p>
    </div>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Lbl_create_question" runat="server" Text="Enter Your Question"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="Txt_Create_Question" runat="server" TextMode="MultiLine" Width="300px" CssClass="questionc" ViewStateMode="Enabled"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Enter End TIme"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="Txt_time" runat="server" TextMode="DateTimeLocal" ViewStateMode="Enabled"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:CheckBox ID="check_1" runat="server" Text="Mulitple Option Allowed" ViewStateMode="Enabled" />
                </td>
            </tr>

        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Options] WHERE ([PollId] = @PollId)" DeleteCommand="DELETE FROM [Options] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Options] ([Option_name], [Count], [PollId]) VALUES (@Option_name, @Count, @PollId)" UpdateCommand="UPDATE [Options] SET [Option_name] = @Option_name, [Count] = @Count, [PollId] = @PollId WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Option_name" Type="String" />
                <asp:Parameter Name="Count" Type="Int32" />
                <asp:Parameter Name="PollId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="PollId" SessionField="Poll_Id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Option_name" Type="String" />
                <asp:Parameter Name="Count" Type="Int32" />
                <asp:Parameter Name="PollId" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div class="auto-style2">
            <center>
                <p>Options</p>
            </center>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" ViewStateMode="Disabled" CssClass="auto-style5" Width="336px" CellPadding="5" CellSpacing="10" GridLines="None">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Option_name" HeaderText="Option_name" SortExpression="Option_name" />
                    <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" />
                    <asp:BoundField DataField="PollId" HeaderText="PollId" SortExpression="PollId" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Write New Option"></asp:Label>
            <asp:TextBox ID="Txt_new_option" runat="server"></asp:TextBox>
            <br />
            <br />
            <center>
                <asp:Button ID="Btn_add_option" runat="server" OnClick="Add_Option" Text="Add Option" class="hover1" />
            </center>
            <p style="text-align: center;">

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ManagePoll.aspx">Back</asp:HyperLink>
                &nbsp;&nbsp;
            <asp:Button ID="btn_Submit_Poll_Question" runat="server" Text="Update Poll" OnClick="Add_poll" class="hover1" />
            </p>
        </div>
    </form>
</body>
</html>
