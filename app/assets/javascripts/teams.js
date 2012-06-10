
$(document).ready(function(){
    console.log("ko");

  // Activate bootstrap elements
  $('#myModal').modal();
  $('.typeahead').typeahead();
  $('.carousel').carousel({
     interval: 2000
  })

  // Csrf verification 
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': jQuery("meta[name='csrf-token']").attr('content')
    }
  });
    
  // My team js hide and show  
  $(".team_btn").click(function(){
    event.preventDefault();
    var choice = $(this).attr('id')
    $(".general").addClass("hide")
    if(choice=="b1")
      $("#a1").removeClass("hide")
    else if(choice=="b2")
       $("#a2").removeClass("hide")
    else 
      $("#a3").removeClass("hide")
  })
    
  // DEcide join request 
  $(".owner_decides").click(function(e){
    e.preventDefault();
    var $this = $(this)
    bootbox.confirm("Are you sure ?", function(result) {
      if (!result) {
        return false
      }
      $.ajax({
        url     : $this.attr("href")
      , success : function (response) {
        if(response.err){
          window.location = "/"
        }
        else{
          $this.parent().remove()
        }
        }
      });
    }); 
    return false
  })
  

  // Make it a normal call with  conf box
  $("#delete_team").click(function(e){
    e.preventDefault();
    bootbox.confirm("Are you sure you want to delete the team ?", function(result) {
      if (!result) {
        return false
      } 
    });
    $.ajax({
        url     : $("#delete_team").attr("href")
      , data    : {}
      , type    : "DELETE"
      , success : function (response) {
          window.location = "/"
        }
      });
     return
  })
  

  // Create team form 
  $("#team_form").submit(function(e){
      e.preventDefault();
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
            if(response.err){
              $('.help-block').last().html(response.data)
              $('.backend').last().addClass("error")      
            }
            else{ 
              window.location = "/"
            }
          }
      });
    return false;
  });


  // Remove member
  $(".removeMember").click(function(){
    event.preventDefault();
    var $this = $(this)
    bootbox.confirm("Are you sure you want to delete the team member ?", function(result) {
      if (!result) {
        return false
      } 
      $.ajax({
          url: this.href,
          type: "DELETE",
          data: {},
          success: function(response) {
              if(response.err){
                window.location = "/"       
              }
              else{ 
                $this.parent().remove()
             }
          }
      });
    });
  return false;
  });

  
  // For page scrolling 
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

  $(".c").click(function(){
    scrollToElement('.contributors');
  })

  $(".m").click(function(){
    scrollToElement('.myteam');
  })
  
});