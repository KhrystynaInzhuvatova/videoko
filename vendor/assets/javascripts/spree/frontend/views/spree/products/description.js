document.addEventListener('turbolinks:load', function () {
  setTimeout(function() {
            document.getElementById("iframe").click();

        },1);

  let lv=document.getElementById("Lviv");
  let l=document.getElementById("London");
  let p=document.getElementById("Paris");

document.getElementById("des").addEventListener("click", function(){
    l.style.display = "block";
    p.style.display = "none";
    lv.style.display = "none";
    document.getElementById("des").classList.add("active");
    document.getElementById("short_des").classList.remove("active");
    document.getElementById("iframe").classList.remove("active");
  });

  $(document).on("click","#short_des", function(){
    p.style.display = "block";
    l.style.display = "none";
    lv.style.display = "none";
    $("#short_des").addClass("active");
    $("#des").removeClass("active");
    $("#iframe").removeClass("active");
  });

  $(document).on("click","#iframe", function(){
    lv.style.display = "block";
    l.style.display = "none";
    p.style.display = "none";
    $("#iframe").addClass("active");
    $("#des").removeClass("active");
    $("#short_des").removeClass("active");

  });

})
