html2canvas(document.body,{
   onrendered:function(canvas){
      canvas.toDataURL("image/png");
      document.body.appendChild('<img src="'+img+'"/>');
   }
});
