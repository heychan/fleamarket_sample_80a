$(function(){
  // 子や孫のカテゴリoption作成に使用
  function appendOption(category){
    let  option = `<option value="${category.id}">
                  ${category.name}
                </option>`;
    return option;
  }
  // 子カテゴリセレクトボックスhtml作成
  function appendChildrenSelection(insertHtml){
    let childrenSelectHtml = "";
    childrenSelectHtml = `<select class="Content__AField" id="children_categories" name="item[category_id]">
                            <option value="">選択して下さい</option>
                            ${insertHtml}
                          </select>`;
    $("#category_select").after(childrenSelectHtml);
  }
  // 孫カテゴリセレクトボックスhtml作成
  function appendGrandchildrenSelection(insertHtml){
    let grandchildrenSelectHtml = "";
    grandchildrenSelectHtml = `<select class="Content__AField" id="grandchildren_categories" name="item[category_id]">
                                <option value="">選択して下さい</option>
                                ${insertHtml}
                              </select>`;
    $("#children_categories").after(grandchildrenSelectHtml);
  }
  // 親カテゴリーセレクトボックスの選択を変えたら、イベント発火
  $("#category_select").on("change", function () {
    // 取得した親カテゴリーのvalueをcategoryに代入
    let parentCategory =  $("#category_select").val();
    console.log(parentCategory)
    // parentCategoryが空でない場合のみAjaxを行う
    if (parentCategory == ""){
      $("#children_categories").remove()
      $("#grandchildren_categories").remove();
    } else {
      // ajaxにて、controllerへ送信
      $.ajax({
        url: "/items/new",
        type: "GET",
        data: {parent_id: parentCategory},
        dataType: "json",
      })
      .done(function(children){
        console.log(children)
        let insertHtml = "";
        // 子カテゴリoptionを1つづつ作成
        children.forEach(function(child){
          insertHtml += appendOption(child);
        });

        if ($("#children_categories").length) {
          // 子カテゴリが既にある場合、子・孫カテゴリを先に取り除く
          $("#grandchildren_categories").remove();
          $("#children_categories").remove();
          // 子カテゴリセレクションの表示
          appendChildrenSelection(insertHtml);
        } else {
          appendChildrenSelection(insertHtml);
        }
      })
      .fail(function(){
        alert("子カテゴリー取得失敗");
      })
    }
  });

  // 子カテゴリ選択でイベント発火
  $(document).on("change", "#children_categories", function(){
    console.log("子カテゴリで発火")
    // 取得した子カテゴリのvalueを代入
    let childCategory = $("#children_categories").val();
    if (childCategory == ""){
      $("#grandchildren_categories").remove();
    } else {
      $.ajax ({
        url: "/items/new",
        type: "GET",
        data: {child_id: childCategory},
        dataType: "json"
      })
      .done(function(grandchildren){
        let insertHtml = "";
        grandchildren.forEach(function(grandchild){
          insertHtml += appendOption(grandchild);
        });

        if ($("#grandchildren_categories").length) {
          $("#grandchildren_categories").remove();
          appendGrandchildrenSelection(insertHtml);
        } else {
          appendGrandchildrenSelection(insertHtml);
        }
      })
      .fail(function(){
        alert("孫カテゴリー取得失敗");
      })
    }
  })
});