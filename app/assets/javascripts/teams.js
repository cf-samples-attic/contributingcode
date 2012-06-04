
$(document).ready(function(){
    console.log("ko");
    $.ajaxSetup({
    headers: {
      'X-CSRF-Token': jQuery("meta[name='csrf-token']").attr('content')
    }
  });
    
    function scrollToElement(selector, callback){
    var animation = {scrollTop: $(selector).offset().top};
    $('html,body').animate(animation, 'slow', 'swing', function() {
        if (typeof callback == 'function') {
            callback();
        }
        callback = null;
    });
    }

    
    
   $(".h").click(function(){
    scrollToElement('.home');
   })

    $(".b").click(function(){
    scrollToElement('.bootcamp');
   })

    $(".t").click(function(){
    scrollToElement('.teams');
   })
 
   $(".p").click(function(){
    scrollToElement('.prizes');
   })

   $(".v").click(function(){
    scrollToElement('.venue');
   })


   $(".s").click(function(){
    scrollToElement('.schedule');
   })

   $(".r").click(function(){
    scrollToElement('.rules');
   })

    
    $("#delete_team").click(function(){
      event.preventDefault();
      console.log("lolsss")
       $.ajax({
          url     : $("#delete_team").attr("href")
        , data    : {}
        , type    : "DELETE"
        , success : function (response) {
               console.log(response.data)
          }
        });
       return
    })
  

    // $("#team_form").submit(function(){
    //     event.preventDefault();
    //     if($("#team_form").find(".error").length > 0 )
    //         return false
    //     var o = {}
    //     console.log($(this));
    //     formValues = $(this).serializeArray()
    //     console.log(formValues)
    //     formValues.map(function(obj) {
    //       if (o[obj.name] !== undefined) {
    //         if (!o[obj.name].push) {
    //             o[obj.name] = [o[obj.name]]
    //         }
    //         o[obj.name].push(obj.value || '')
    //       } else {
    //         o[obj.name] = obj.value || ''
    //       }
    //     });
        
    //     console.log(o);
    //     return false;
    //     $.ajax({
    //         url: '/teams',
    //         type: "POST",
    //         data: o,
    //         success: function(response) {
    //             if(response.err)
    //               $("#my_helper").html("<p>"+response.data+"</p>").removeClass("error").addClass("error")
    //             else{ 
    //                 $("#create_team").remove();
    //                 $("#teams_list").append("<li>"+response.data.name+"</li>");
    //            }
    //         }
    //     });
    //         return false;
    //     });

    });