$(document).ready(function(){
  let elem = document.getElementById('sidenav');
  let elem2 = document.getElementById('sidenav_blue');
  let search = document.getElementById('search-drop');

  $("#closeNav").click(function(){
     elem.style.width = "0";
     elem2.style.width = "0";
     });
   $("#openNav").click(function(){
     elem.style.width = "25rem";
     elem2.style.width = "100%";
     });
     $(".blue").click(function(){
        elem.style.width = "0";
        elem2.style.width = "0";
        });

    $("#search-icon").click(function(){
      search.style.width = "100%";
          });
    $("#closesearch").click(function(){
       search.style.width = "0";

           });

});
