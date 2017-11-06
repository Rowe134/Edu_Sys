<%@ Page Title="登录" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>


<!DOCTYPE html>
<html lang="zh">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - 教务系统</title>

    <link rel="stylesheet" type="text/css" href="~/Content/css" />
    <link rel="stylesheet" type="text/css" href="~/Content/base.css">
</head>

<body>
    <form runat="server">
    <div style="height:100px;margin-top:10px">
        <h1 style="line-height:100px;text-align:center">欢迎使用本系统</h1>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2"><h2>登录</h2></div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4 >使用本地帐户登录。</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group" runat=server>
                        <div class="col-md-2"></div>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">用&nbsp;户&nbsp;&nbsp;名：</asp:Label>
                        <div>
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="“用户名”字段是必填字段。" />
                        </div>
                    </div>
                    <div class="form-group" runat=server>
                        <div class="col-md-2"></div>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</asp:Label>
                        <div>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="“密码”字段是必填字段。" />
                        </div>
                    </div>
                    <div class="form-group" runat=server>
                        <div class="col-md-2"></div>
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">用户身份：</asp:Label>
                        <div style="height:33px;line-height:33px;">
                            <asp:RadioButton GroupName="Identity" Text="学生用户" ID="Identity1" runat="server" />&nbsp;
                            <asp:RadioButton GroupName="Identity" Text="教师用户" ID="Identity2" runat="server" />&nbsp;
                            <asp:RadioButton GroupName="Identity" Text="二级管理员用户" ID="Identity3" runat="server" />&nbsp;
                            <asp:RadioButton GroupName="Identity" Text="系统管理员用户" ID="Identity4" runat="server" />
                        </div>
                    </div>
                    <div class="form-group" runat=server>
                        <div class="col-md-3"></div>
                        <div class="col-md-9" runat=server>
                            <asp:Button ID="Button1" runat="server" OnClick="LogIn" Text="登录" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">注册</asp:HyperLink>
                    如果你没有本地帐户。
                </p>
            </section>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="container body-content" style="margin-top: 100px">
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - 教务系统</p>
            </footer>
    </div>
    </form>
    <script src="../Scripts/mymenu.js"></script>
</body>

</html>

