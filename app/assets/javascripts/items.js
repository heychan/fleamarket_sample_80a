$(function(){
  $("form").on('change', 'input[type="file"]', function(e) {
    let //file = e.target.files[0],
        images = [];
        index = $('.HiddenField').data('image')
        console.log(index)
        file = e.target.files[(index)],
        reader = new FileReader(),
        $preview = $(`#item_images_attributes_${index}_image`);

    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.before($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);
    $('.CameraIcon').css("display" , "none");
    

    reader.readAsDataURL(file);
  });
})