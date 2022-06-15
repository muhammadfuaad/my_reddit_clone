//= require jquery3
//= require jquery_ujs

$(function(){
    console.log("loading..");
    $(".vote").on("click", ".upvote, .downvote", function(){
      var post_d = $(this).parent().data("id"),
      is_upvote = $(this).hasClass("upvote");
  
      $.ajax({
        url: "/post/vote",
        method: "POST",
        data: {post_id: post_id, upvote: is_vote},
        success: function(){
          console.log("Success")
        }
  
      });
    });
    
  });