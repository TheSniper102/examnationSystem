<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="groups.aspx.cs" Inherits="adminPages_groups" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        uu<asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
           
            <div class="col-md-6">
                <!-- Primary box -->
                <div class="box box-solid box-primary">
                    <div class="box-header">
                        <h3 class="box-title">groups</h3>
                        
                    </div>
                    <div class="box-body table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="475px" CssClass="table  table-hover">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="descrption" HeaderText="descrption" SortExpression="descrption" />
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [name], [descrption], [id] FROM [groups]" DeleteCommand="DELETE FROM [groups] WHERE [id] = @id" InsertCommand="INSERT INTO [groups] ([name], [descrption]) VALUES (@name, @descrption)" UpdateCommand="UPDATE [groups] SET [name] = @name, [descrption] = @descrption WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="descrption" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="descrption" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
             
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
