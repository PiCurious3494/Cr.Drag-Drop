<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dragDrop.aspx.cs" Inherits="dragDrop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Thank you for your opinions</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8"/>
<script src="/jquery/lib/jquery.js"></script>
<script src="/jquery/dist/jquery.validate.js"></script>
<script src="/js/jquery-ui.js"></script>
<script src="/js/jquery.ui.touch-punch.min.js"></script>
<link rel="stylesheet" href="style.css" type="text/css"/>
<link rel="stylesheet" href="sort.css" type="text/css"/>
<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css"/>

      <style>
.circle-container {
	position: relative;
	width: 24em;
	height: 24em;
	padding: 2.8em; /*= 2em * 1.4 (2em = half the width of an img, 1.4 = sqrt(2))*/
	/*border: dashed 1px;*/
	border-radius: 50%;
	margin: 1.75em auto 0;
    /*background: url("radio.png") no-repeat 85px;*/ 
}

.circle-container:before {
  position: absolute;
  font-family: 'FontAwesome';
  font-size:180px; 
  margin: 0px 0 0 -80px;
  color:#0068af; 
  content: "\f001";
}

.drop {
	position: relative;
	width: 12em;
	height: 12em;
	padding: 6.8em; /*= 2em * 1.4 (2em = half the width of an img, 1.4 = sqrt(2))*/
	/*border: dashed 1px;*/
	border-radius: 50%;
	margin: 1.75em 50px 0;
   
}



.circle-container li {
	display: block;
	overflow: hidden;
	position: absolute;
	top: 50%; left: 50%;
	margin: -2em; /* 2em = 4em/2 */ /* half the width */
}


.circle-container img { display: block; width: 100%; z-index:-99;}
.deg1 { transform: translate(14em); }
.deg2 { transform: rotate(45deg) translate(14em) rotate(-45deg); }
.deg3 { transform: rotate(135deg) translate(14em) rotate(-135deg); }
.deg4 { transform: translate(-14em); }
.deg5 { transform: rotate(225deg) translate(14em) rotate(-225deg); }
.deg6 { transform: rotate(315deg) translate(14em) rotate(-315deg); }

@media screen and (max-width: 600px) {

    .circle-container {
        width: 12em;
	    height: 12em;
        margin: 5.75em auto 0;
     
    }
    .deg1 { transform: translate(9em); }
    .deg2 { transform: rotate(45deg) translate(9em) rotate(-45deg); }
    .deg3 { transform: rotate(135deg) translate(9em) rotate(-135deg); }
    .deg4 { transform: translate(-9em); }
    .deg5 { transform: rotate(225deg) translate(9em) rotate(-225deg); }
    .deg6 { transform: rotate(315deg) translate(9em) rotate(-315deg); }

    .circle-container li {
       margin: -3em; 
    }	

    .circle-container:before {
      position: absolute;
      font-family: 'FontAwesome';
      font-size:100px; 
      margin: -43px 0 0 -50px;
      color:#0068af; 
      content: "\f001";
    }

    .drop {
	position: relative;
	width: 6em;
	height: 6em;
	padding: 3.8em; /*= 2em * 1.4 (2em = half the width of an img, 1.4 = sqrt(2))*/
	/*border: dashed 1px;*/
	border-radius: 50%;
	margin: -2.25em -13px 0;
   
   
}
    .roundtable {
        border: none; 
    }
     .surveyFrame {
        margin: auto; 
    }


}

    </style>
<script>

    $.validator.setDefaults({
        ignore: []

    });
    $(document).ready(function () {

        $("#form1").validate({

            rules: {
                q303b: {
                    required: function (e) {
                        if ($("input[name=q303b]").val() == "") {
                            return true;
                        }
                        else {
                            return false;
                        }
                    }
                }
            }
        });

        var good;
        var selectedItems = [""];

        $(".deg1").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort1");
            }

        });
        $(".deg2").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort2");
            }
        });

        $(".deg3").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort3");
            }
        });

        $(".deg4").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort4");
            }
        });

        $(".deg5").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort5");
            }
        });
        $(".deg6").draggable({
            revert: "invalid",
            start: function (event, ui) {
                $(this).attr("class", "ui-draggable ui-draggable-dragging ui-draggable-handle sort6");
            }
        });




        $(".drop").droppable({
            accept: ".ui-draggable",
            drop: function (event, ui) {
                var $this = $(this);
                var index = ui.draggable.attr("id");
                selectedItems.push(index);
                ui.draggable.position({
                    my: "center",
                    at: "center",
                    of: $this,
                    using: function (pos) {
                        $(this).animate(pos, 200, "linear");
                    }
                });
                $("input[id=q303]").val(selectedItems);
                good = -1;
                $("input[name=q303b]").val(good);
                $("input[name=q303b]").valid();
            }
        });

        $("#refresh").click(function () {
            $(".sort1").attr("class", "ui-draggable ui-draggable-handle deg1");
            $(".sort2").attr("class", "ui-draggable ui-draggable-handle deg2");
            $(".sort3").attr("class", "ui-draggable ui-draggable-handle deg3");
            $(".sort4").attr("class", "ui-draggable ui-draggable-handle deg4");
            $(".sort5").attr("class", "ui-draggable ui-draggable-handle deg5");
            $(".sort6").attr("class", "ui-draggable ui-draggable-handle deg6");
            $("input[name=q303b]").val("");
            $("input[id=q303]").val("");
        });

    });

    $.validator.messages.required = 'Please drag items into the center of the circle.';
</script>
</head> 
<body>
    <form id="form1" class="cmgform" runat="server">
    <div class="surveyFrame">
    
         <p class="centered">&nbsp;</p>
                        <p class="centered">Please select the words that you think REALLY describe (INSERT STATION).</p>                           
                        <p class="centered">Drag your selected items into the center of the circle below.</p>
                         <p class="centered"><button type="button" id="refresh"><i class="fa fa-refresh" aria-hidden="true"></i> Restart</button></p>	
                          <p class="centered">&nbsp;</p>	
                        <div class='circle-container'>
                                <div id="drop" class="drop"></div> 
                            <ul id="sortable">                        
                                <%  for (int k = 0; k < shuffledList.Count; k++){
                                    index = shuffledList[k];
                                    items = itemsArray[index];                                
                                   %>
                                <li class="deg<%=k+1%>" id="<%=index%>"><%=items%></li>
                                  <% } %>
                            </ul>
                        </div>
                          <p class="centered">&nbsp;</p>
                          <p class="centered">&nbsp;</p>
                          <p class="centered">&nbsp;</p>
         <p>These text boxes will not be displayed live.  It is shown to demonstrate how the data will be captured for the database. </p>
                        <asp:TextBox runat="server" name="q303" ID="q303" OnTextChanged="q303_TextChanged"> </asp:TextBox>
                        <asp:TextBox runat="server" ID="q303b"  AutoPostBack="true" OnTextChanged="q303b_TextChanged"></asp:TextBox> 
                        <p class="centered"><label for="q303b" class="error"></label></p>            
					    <p class="centered">&nbsp;</p>
                        <p class="centered">&nbsp;</p>
                        <p><asp:Button ID="Back" runat="server" Text="Back to Demo Page" OnClick="Back_Click" /></p>
                        <p class="centered">&nbsp;</p>
    
    </div>
    </form>
</body>
</html>
