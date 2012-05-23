
$(document).ready(function(){
    $("#team_form").submit(function(){
        event.preventDefault();
        var o = {}
        formValues = $(this).serializeArray()
        
        formValues.map(function(obj) {
          if (o[obj.name] !== undefined) {
            if (!o[obj.name].push) {
                o[obj.name] = [o[obj.name]]
            }
            o[obj.name].push(obj.value || '')
          } else {
            o[obj.name] = obj.value || ''
          }
        });
        console.log("before");
        $.ajax({
            url: '/teams',
            type: "POST",
            data: o,
            success: function(response) {
                if(response.err)
                  $("#my_helper").html("<p>"+response.data+"</p>")
                else{ 
                    $("#create_team").remove();
                    $("#teams_list").append("<li>"+response.data.name+"</li>");
               }
            }
        });
            return false;
        });

    });