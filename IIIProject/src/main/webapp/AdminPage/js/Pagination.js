

function paginationCreate() {
    let paginationString = '<li class="page-item "> <a class="page-link" id="Previous" href="#" >上頁</a> </li>';

    let ln = $("#myTable tr.ShowPage").length;//讀取目前有幾筆資料
    let onePageShowCount = 10;//一頁幾筆資料(自訂參數)
    let pagTotalCount = parseInt(ln / onePageShowCount) + 1;//要呈現幾個頁面標籤
    let pagMaxParameter = 3;//設定超過幾頁就要隱藏頁籤(自訂參數)
    let pagLastPage = ln - (pagTotalCount - 1) * 10;//最後的頁有幾筆資料
    
    if(pagLastPage==0){//如果剛好最後一頁沒有資料了，就少一個頁籤
        pagTotalCount=pagTotalCount-1;
        pagLastPage=onePageShowCount;
    };

    for (i = 0; i < pagTotalCount; i++) {
        paginationString += `<li class="page-item"><a class="page-link" id=${"page" + (Number(i) + 1)} href="#">${Number(i) + 1}</a></li>`;
    }

    paginationString += '<li class="page-item"> <a class="page-link" id="Next" href="#">下頁</a> </li>';

    $("#paginationArea").html(paginationString);

    let tempPaginationString;
    if (pagTotalCount >= pagMaxParameter) {
        tempPaginationString = '<li class="page-item disabled"><a class="page-link" id="pageMore"  tabindex="-1" href="#">...</a></li>';
        $(`#page${pagTotalCount - 1}`).parent().after(tempPaginationString);
        for (i = pagMaxParameter + 1; i <= pagTotalCount - 1; i++) {
            $(`#page${i}`).hide();
        }
    }

    function isHiddenPage() {
        if ($(".active").children().is(":hidden")) {
            let moveShowPage = Number($(".active").children().text());
            // console.log("隱藏中");
            for (i = 1; i < pagTotalCount + 2; i++) {

                if ((i < pagTotalCount)) {

                    $("nav ul li a").eq(i).hide();
                }
                if (i >= moveShowPage && i <= (pagMaxParameter - 1 + moveShowPage)) {
                    $("nav ul li a").eq(i).show();
                }
            }


        }

        if (Number($("nav ul li a:visible").eq(1).text()) >= pagTotalCount - pagMaxParameter) {
            $("#pageMore").hide();
        } else {
            $("#pageMore").show();
        }
    }

    $("nav ul li a").click(function (event) {
        $(".ShowPage").hide();
        let pageId = event.target.id;

        if (pageId != "Next" && pageId != "Previous" && pageId != "pageMore") {//點擊有號碼的頁標籤
            $(".active").removeClass("active");
            $(this).parent().addClass("active");
            isHiddenPage();//控制頁籤顯示
            let pageNumber = pageId.substring(4, pageId.length);
            if (pageNumber != pagTotalCount) {//不等於最後一頁
                for (i = pageNumber * onePageShowCount - 10; i < pageNumber * onePageShowCount; i++) {
                    $(".ShowPage").eq(i).show();//控制tr顯示
                }
            } else {//最後一頁
                for (i = pageNumber * onePageShowCount - 10; i < pageNumber * onePageShowCount - 10 + pagLastPage; i++) {
                    $(".ShowPage").eq(i).show();//控制tr顯示
                }
            }
            // console.log("單頁");
        } else if (pageId == "Next") {
            let nowPage = $(".active").children().text();
            if (Number(nowPage) == pagTotalCount) {
                alert("超出範圍!");
                $("#page" + nowPage).click();
            } else {
                $(".active").removeClass("active");
                let nextPage = "page" + String(Number(nowPage) + 1);
                $("#" + nextPage).click();
                // console.log("下一頁");
            }

        } else if (pageId == "Previous") {
            let nowPage = $(".active").children().text();
            if (Number(nowPage) == 1) {
                alert("超出範圍!");
                $("#page" + nowPage).click();
            } else {

                $(".active").removeClass("active");
                let previousPage = "page" + String(Number(nowPage) - 1);
                $("#" + previousPage).click();
                // console.log("上一頁");
            }

        } else if (pageId == "pageMore") {
            // $(".active").removeClass("active");
            console.log("更多");
        }
    })

    $("#page1").click();

    // $("nav").click(function (event) {
    //     alert('rwerwe');
    //     console.log(event.target);
    //     console.log(event.target.id);
    // })
}