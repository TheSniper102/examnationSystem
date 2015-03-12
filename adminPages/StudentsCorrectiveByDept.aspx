<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="StudentsCorrectiveByDept.aspx.cs" Inherits="StudentsCorrectiveByDept" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="datasourcedept" DataTextField="Dept_Name" DataValueField="Dept_Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="datasourcedept" runat="server" ConnectionString="<%$ ConnectionStrings:Exam_Sys %>" SelectCommand="SELECT [Dept_Name], [Dept_Id] FROM [Department]"></asp:SqlDataSource>
            </div>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="475px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    Sorry, No Corrective Students<br />
                </EmptyDataTemplate>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectCorectiveStudentBydept" TypeName="QuestionBusinnessLayer">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="dept" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
