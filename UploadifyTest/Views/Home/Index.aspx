<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hello World!!!
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {

        $("#fileInput1").uploadify({
            'uploader': '<%= Url.Content("~/Scripts/jquery.uploadify-v2.1.4/uploadify.swf")%>',
            'script': '<%= Url.Content("~/Resource/Upload") %>',
            'auto': false,
            'multi': false,
            'expressInstall': '<%= Url.Content("~/Scripts/jquery.uploadify-v2.1.4/expressInstall.swf")%>',
            'cancelImg': '<%= Url.Content("~/Scripts/jquery.uploadify-v2.1.4/cancel.png") %>',
            'scriptAccess': 'always',
            'hideButton': false,
            'fileDesc': 'SQLite3 database files (*.db)',
            'fileExt': '*.db',
            'fileDataName': 'uploadedFile',
            'sizeLimit': 1000000000,
            'onError': function (event, ID, fileObj, errorObj) {
                alert("name: " + fileObj.name + " error type: " + errorObj.type + ", info: " + errorObj.info);
            },
            'onAllComplete': function (event, data) { 
                alert("allcomplete => " + data.filesUploaded + ":" + data.errors + ":" + data.allBytesLoaded + ":" + data.speed); 
            },
            'onCheck': function () { 
                alert("oncheck"); 
            },
            'onComplete': function (event, id, fileObj, response, data) {
                alert("oncomplete => " + ":" + fileObj.name + ":" + fileObj.filePath + ":" + fileObj.size + ":" + response);
            },
            'onOpen': function (event, id, fileObj) { 
                alert("onopen => " + ":" + fileObj.name + ":" + fileObj.filePath + ":" + fileObj.size); 
            },
            'onProgress': function (event, id, fileObj, data) {
                alert("onprogress => " + ":" + fileObj.name + ":" + fileObj.filePath + ":" + fileObj.size + ":" + data.percentage + ":" + data.bytesLoaded + ":" + data.allBytesLoaded + ":" + data.speed);
            }
        });
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: ViewData["Message"] %></h2>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">
            http://asp.net/mvc</a>.
    </p>
    <div id="InterestingDiv">
        <p align="center">
            <input id="fileInput1" name="fileInput1" type="file" />
            <a href="javascript:$('#fileInput1').uploadifyUpload();">Upload Files</a></p>
    </div>
</asp:Content>
