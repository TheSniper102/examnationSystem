<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="adminPages_profile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4 class="page-header">Welcome <%=Auth_BLL.currentUsername() %>

        <small>you can view your information from here</small>
    </h4>
    <div class="row">
        <div class="col-md-10 col-lg-10 col-xs-10">
            <!-- Default box -->
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Information</h3>

                </div>
                <div class="box-body">

                    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1">
                    </asp:GridView>

                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="InstructorProfile" TypeName="ProfileBusinessLayer">
                        <SelectParameters>
                            <asp:SessionParameter Name="ins_id" SessionField="ins_id" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="~/adminPages/InsUpdateData.aspx">Change  Data</asp:HyperLink>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->
        </div>
    </div>
</asp:Content>
