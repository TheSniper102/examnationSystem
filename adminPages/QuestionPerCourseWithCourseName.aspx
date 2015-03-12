<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="QuestionPerCourseWithCourseName.aspx.cs" Inherits="QuestionPerCourseWithoutAnswer" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>

                <div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourcepro" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Question ID" />
                            <asp:BoundField DataField="Describtion" HeaderText="Description" />
                            <asp:BoundField DataField="Type" HeaderText="Type" />
                            <asp:BoundField DataField="A" HeaderText="Choice A" />
                            <asp:BoundField DataField="B" HeaderText="Choice B" />
                            <asp:BoundField DataField="C" HeaderText="Choice C" />
                            <asp:BoundField DataField="D" HeaderText="Choice D" />
                            <asp:BoundField DataField="Crs_Name" HeaderText="Course Name" />
                        </Columns>
                        <EmptyDataTemplate>
                            sorry there is no data
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSourcepro" runat="server" SelectMethod="selectQuestionWithCourseName" TypeName="QuestionBusinnessLayer"></asp:ObjectDataSource>

                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
