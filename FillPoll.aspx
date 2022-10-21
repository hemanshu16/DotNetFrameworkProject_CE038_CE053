<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillPoll.aspx.cs" Inherits="WebApplication1.FillPoll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', 'Geneva', 'Verdana', 'sans-serif';
        }

        .auto-style1 {
            margin: auto;
            border-radius: 30px;
            box-shadow: rgb(38,57,77) 0px 20px 30px -10px;
            width: fit-content;
            background-color: white;
            padding: 35px 80px;
            box-sizing: border-box;
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

        .headp {
            text-decoration: underline;
        }

        .question {
            margin-bottom: 30px;
        }

        body {
            background-color: aliceblue;
        }

        .subbtn {
            padding: 5px 15px;
            border-radius: 3px;
            border: none;
            margin: auto;
            font-size: 20px;
        }

            .subbtn:hover {
                background-color: white;
                border: 0.5px solid black;
            }

        .btn {
            width: auto;
            text-align: center;
        }

        .sharelink {
            width: 335px;
            padding: 2px 10px;
        }

        .copybtn {
            border: none;
            padding: 3px 10px;
            border-radius: 3px;
        }

            .copybtn:hover {
                background-color: white;
                border: 0.5px solid black;
            }

        .bottomc {
            width: 100%;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="head">
        <p class="headp">My Poll</p>
    </div>
    <form id="form1" runat="server">

        <asp:Panel ID="panel_data" runat="server" CssClass="auto-style1">
            <p>Question :- </p>
            <asp:Label ID="lbl_question" runat="server" Text="Label" CssClass="question"></asp:Label>
            <p>Options :-</p>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Option_name" DataValueField="Id">
            </asp:CheckBoxList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Option_name], [Id] FROM [Options] WHERE ([PollId] = @PollId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="PollId" QueryStringField="Poll_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Option_name" DataValueField="Id">
            </asp:RadioButtonList>
            <br />
            <div class="btn">
                <asp:Button ID="btn_Poll_Submit" runat="server" OnClick="Submit_Poll" Text="Submit" CssClass="subbtn" />
            </div>
            <br />
            <div class="bottomc">
                <label>Share Poll </label>
                <asp:TextBox ID="txt_share_link" runat="server" CssClass="sharelink"></asp:TextBox>
                <asp:Button ID="btn_copy" runat="server" Text="Copy" CssClass="copybtn" />
            </div>
        </asp:Panel>
        <br />
        <center>
            <asp:Label ID="lbl_error" runat="server" Text="Poll Response time is ended."></asp:Label></center>
    </form>
    <script>
        var ele = document.getElementById("txt_share_link");
        if (ele) {
            ele.value = window.location.href;
        }
        var ele1 = document.getElementById("txt_share_link");
        if (ele1) {
            ele1.disabled = true;
        }
        function myFunction() {
            // Get the text field
            var copyText = document.getElementById("txt_share_link");

            // Select the text field
            copyText.select();
            copyText.setSelectionRange(0, 99999); // For mobile devices

            // Copy the text inside the text field
            navigator.clipboard.writeText(copyText.value);

            // Alert the copied text
            alert("Copy Text to ClipBoard :" + copyText.value);
        }

        document.getElementById("btn_copy").addEventListener('click', myFunction);
    </script>

</body>
</html>
