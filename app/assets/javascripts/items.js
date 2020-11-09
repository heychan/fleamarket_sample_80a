$(document).on('turbolinks:load', function(){

   $(function(){
     function buildHTML(count) {
        let html = `<div class="preview-box" id="preview-box__${count}">
                     <div class="upper-box">
                       <img src="" alt="preview">
                     <div>
                     <div class="lower-box">
                       <div class="update-box">
                         <label class="edit_btn">編集<label>
                       <div>
                       <div class="delete-box" id="delete_btn_${count}">
                         <span>削除<span>
                       <div>
                     <div>
                   <div>`
       return html;
     }
      //  $(function(){
      //     //querySelectorでfile_fieldを取得
      //    var file_field = document.querySelector('input[type=file]')
      //     //fileが選択された時に発火するイベント
      //    $('.Content__Image__Form').change(function(){
      //       //選択したfileのオブジェクトをpropで取得
      //       var file = $('input[type="file"]').prop('files')[0];
      //       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      //       var fileReader = new FileReader();
      //       //読み込みが完了すると、srcにfileのURLを格納
      //      fileReader.onloadend = function() {
      //         var src = fileReader.result
      //         var html= `<img src="${src}" width="200" height="200">`
      //         //image_box__container要素の前にhtmlを差し込む
      //        $('.Content__Image__Field').after(html);
      //      }
      //      fileReader.readAsDataURL(file);
      //    });
      //  });
         function setLabel() {
            //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
            let prevContent = $('.Content__Image__label').prev();
           labelWidth = (620 - $(prevContent).css('width').replace(/[0-9]/g, ''));
           $('.Content__Image__label').css('width', labelWidth);
         }
          $(document).on('change', '.HiddenField', function() {
            setLabel();
             //hidden-fieldのidの数値のみ取得
             let id = $(this).attr('id').replace(/[^0-9]/g, '');
             //labelボックスのidとforを更新
            $('.LabelBox').attr({id: `LabelBox--${id}`,for: `item_images_attributes_${id}_image`});
             //選択したfileのオブジェクトを取得
             let file = this.files[0];
             let reader = new FileReader();
             //readAsDataURLで指定したFileオブジェクトを読み込む
            reader.readAsDataURL(file);
            //読み込み時に発火するイベント
           reader.onload = function() {
              let image = this.result;
              //プレビューが元々なかった場合はhtmlを追加
             if ($(`#preview-box__${id}`).length == 0) {
               var count = $('.preview-box').length;
                var html = buildHTML(id);
                //ラベルの直前のプレビュー群にプレビューを追加
                var prevContent = $('.Content__Image__label').prev();
               $(prevContent).append(html);
             }
              //イメージを追加
             $(`#preview-box__${id} img`).attr('src', `${image}`);
               var count = $('.preview-box').length;
              //プレビューが5個あったらラベルを隠す 
             if (count == 5) { 
               $('.Content__Image__label').hide();
             }
              //ラベルのwidth操作
             setLabel();
              //ラベルのidとforの値を変更
             if(count < 5){  
                //プレビューの数でラベルのオプションを更新する
               $('LabelBox').attr({id: `LabelBox--${count}`,for: `item_images_attributes_${count}_image`});
             }
           }
         });

           //画像の削除
         $(document).on('click', '.delete-box', function() {
          var count = $('.preview-box').length;
          setLabel(count);
           //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
           var id = $(this).attr('id');
           //取得したidに該当するプレビューを削除
          $(`#preview-box__${id}`).remove();
          console.log("new")
           //フォームの中身を削除 
          $(`#item_images_attributes_${id}_image`).val("");

           //削除時のラベル操作
          var count = $('.preview-box').length;
           //5個めが消されたらラベルを表示
          if (count == 4) {
            $('.Content__Image__Form').show();
          }
          setLabel(count);

          if(id < 5){
             //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
            $('LabelBox').attr({id: `LabelBox--${id}`,for: `item_images_attributes_${id}_image`});
          };
        });
     });
   });