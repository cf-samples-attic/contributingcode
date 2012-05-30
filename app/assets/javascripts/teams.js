
$(document).ready(function(){
    console.log("ko");
    function scrollToElement(selector, callback){
    var animation = {scrollTop: $(selector).offset().top};
    $('html,body').animate(animation, 'slow', 'swing', function() {
        if (typeof callback == 'function') {
            callback();
        }
        callback = null;
    });
    }

    
    $(".b1").click(function(){
        var button_value = this.value;
        console.log(button_value);
        if(this.value=="Home")
            scrollToElement('.home');
        else if(this.value=="Bootcamp") 
            scrollToElement('.bootcamp');
        else if(this.value=="Rules") 
            scrollToElement('.rules');
        else if(this.value=="Schedule") 
            scrollToElement('.schedule');
        else if(this.value=="Venue") 
            scrollToElement('.venue');
        else if(this.value=="Prizes") 
            scrollToElement('.prizes');
        else if(this.value=="Teams") 
            scrollToElement('.teams');
        else 
            console.log("invalid");
    });



    $("#team_form").submit(function(){
        event.preventDefault();
        if($("#team_form").find(".error").length > 0 )
            return false
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
        
        $.ajax({
            url: '/teams',
            type: "POST",
            data: o,
            success: function(response) {
                if(response.err)
                  $("#my_helper").html("<p>"+response.data+"</p>").removeClass("error").addClass("error")
                else{ 
                    $("#create_team").remove();
                    $("#teams_list").append("<li>"+response.data.name+"</li>");
               }
            }
        });
            return false;
        });

    });