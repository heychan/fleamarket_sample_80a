$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="JsFile__Group">
                    <input class="JsFile" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image"><br>
                    <div class="JsRemove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="Content__Field>
                    <div class="JsFile">
                      <img data-index="${index}" src="${url}" >
                    <div class="JsRemove">削除</div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.JsFile__Group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('.Content__Field__Image').on('change', '.JsFile', function(e) {
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    $('label').attr('for', `item_item_images_attributes_${targetIndex+1}_image`);
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.Content__Field__Previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.Content__Field__Image').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }

    let count = $('img').length;
      //プレビューが5あるときは、カメラアイコンを消しておく
      if (count >= 6) {
        $('#CameraIcon').css('display', 'none');
      }
  });

  $('.Content__Field__Image').on('click', '.JsRemove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.JsFile').length == 0) $('.Content__Field__Image').append(buildFileField(fileIndex[0]));  

      $('#CameraIcon').css('display', 'block');
  });
});