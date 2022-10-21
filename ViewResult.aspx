<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="WebApplication1.ViewResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h2 {
            text-align: center;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', 'Geneva', 'Verdana', 'sans-serif';
        }
    </style>
</head>
<body>
    <div>
        <h2>Result</h2>
    </div>
    <form id="form1" runat="server">
        <center>
            <div>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="332px" Width="833px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="Option_name" YValueMembers="Count">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Options] WHERE ([PollId] = @PollId2)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PollId2" QueryStringField="Poll_Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </center>
    </form>
    <h2>Thank You</h2>

</body>
</html>
