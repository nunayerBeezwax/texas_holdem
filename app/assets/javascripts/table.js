$(document).ready(function(){

  //Dealing the Cards...
  $('.footer #deal').click(function(){
    var pathname = window.location.pathname
    $.ajax({
        url:"/api"+pathname+"/deal.json",
        type:"GET", 
        success: function(data){
          $('.hands span').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#card'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  }); 

  $('.footer #flop').click(function(){
    $.ajax({
        url:"/api"+pathname+"/flop.json",
        type:"GET", 
        success: function(data){
          $('.board').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#board'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  }); 

  $('.footer #turn').click(function(){
    $.ajax({
        url:"/api"+pathname+"/turn.json",
        type:"GET", 
        success: function(data){
          $('.hands span').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#card'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  });	

  $('.footer #river').click(function(){
		$.ajax({
  			url:"/api"+pathname+"/river.json",
  			type:"GET", 
  			success: function(data){
          $('.hands span').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#card'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  });
});
