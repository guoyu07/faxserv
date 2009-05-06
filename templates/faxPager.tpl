<script type="text/javascript">

var element_id  = null;
var first       = null;
var last        = null;
var banner      = null;

$(document).ready(function(){
    $("#dialog").dialog({ autoOpen: false, draggable: false, resizable: false, modal: true});
    $("#dialog").dialog('option', 'buttons', { "Cancel": handleDialogCancel, "Ok": handleDialogOk});
});

function showNameDialog(id)
{
    elementId = id;

    $("#id").attr('value', id);
    $("#dialog").dialog("open");

    var name = $("#" + elementId + "_name").html().split(' ');

    $("#firstname").attr('value', name[0]);
    $("#lastname").attr('value', name[1]);
    $("#bannerid").attr('value', $("#" + elementId + "_bannerid").html());
}

function handleDialogOk()
{
    element_id  = $("#id").attr('value');
    first       = $("#firstname").attr('value');
    last        = $("#lastname").attr('value');
    banner      = $("#bannerid").attr('value');

    $.get("index.php", {module: "faxmaster", op: "set_name_id", id: elementId, firstName: first, lastName: last, bannerId: banner}, handleCallback);
}

function handleCallback(data)
{
    if(data == "1"){
        $("#dialog").dialog('close');
        $("#" + elementId + "_bannerid").html(banner);
        $("#" + elementId + "_name").html(first + " " + last);
    }else{
        alert('Error saving data.');
    }

    element_id  = null;
    first       = null;
    last        = null;
    banner      = null;

    element_id  = $("#id").attr('value', "");
    first       = $("#firstname").attr('value', "");
    last        = $("#lastname").attr('value', "");
    banner      = $("#bannerid").attr('value', "");

}

function handleDialogCancel()
{
    $("#dialog").dialog("close");
}

</script>

<table class="faxmaster_faxPager" cellpadding="2">
    <tr>
        <th>File Name</th>
        <th>Sender Phone</th>
        <th>Date Received{DATERECEIVED_SORT}</th>
        <th>Banner ID</th>
        <th>Name</th>
        <th>Pages</th>
        <th>Action</th>
    </tr>
    <!-- BEGIN empty_table -->
    <tr>
        <td colspan="3">{EMPTY_MESSAGE}</td>
    </tr>
    <!-- END empty_table -->
    <!-- BEGIN listrows -->
    <tr {TOGGLE} {printed}>
        <td>{fileName}</td>
        <td>{senderPhone}</td>
        <td>{dateReceived}</td>
        <td id="{id}_bannerid">{bannerId}</td>
        <td id="{id}_name">{name}</td>
        <td>{numPages}</td>
        <td>{actions}</td>
    </tr>
    <!-- END listrows -->
</table>
<div class="align-center">
    {TOTAL_ROWS}<br />
    {PAGE_LABEL} {PAGES}<br />
    {LIMIT_LABEL} {LIMITS}<br />
    {CSV_REPORT}
</div>


<div id="dialog" title="Add Name & Banner ID">
    <form>
        <input type="hidden" id="id" value="">
        <table>
          <tr>
            <td>Banner Id: </td>
            <td><input type="text" id="bannerid"><br /></td>
          </tr>
          <tr>
            <td>First Name: </td>
            <td><input type="text" id="firstname"><br /></td>
          </tr>
          <tr>
            <td>Last Name: </td>
            <td><input type="text" id="lastname"><br /></td>
          </tr>
        </table>
    </form>
</div>
