$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
//  $(function(){
//   $("form").on('change', '.HiddenField', function(e) {
//     let index = $(this).data('id')
//         // index = $('.HiddenField').data('id')
//         console.log(index)
// debugger
//         file = e.target.files[0],
//         reader = new FileReader(file),
//         $preview = $(`#item_images_attributes_${index}_image`);

//     //  if(file.type.indexOf("image") < 0){
//     //    return false;
//     //  }
//     reader.onload = (function(file) {
//       return function(e) {
//         $preview.empty();
//         $preview.before($('<img>').attr({
//                   src: e.target.result,
//                   width: "150px",
//                   class: "preview",
//                   // title: file.name
//               }));
//       };
//     })(file);
//     $(`#CameraIcon--${index}`).css("display" , "none");
    

//     reader.readAsDataURL(file);
//   });
// })