$(document).ready(function () {
    /*
    $("#userid").change(function () { //id check
        if ($("#userid").val() == '') {
            return;
        }

        var userid = $("#userid").val();
        if (userid.length < 6 || userid.length > 20) {
            $('#userid').focus();
            return;
        } //id 형식

        $.ajax({
            url: 'userlist.xml',
            success: function (data) {

                var flag = false;
                $.each($(data).find('id'), function (index, idElement) {
                    if ($(idElement).text() == $("#userid").val()) {
                        flag = true;
                    }
                });
                if (flag) {
                    $('#userid').focus();
                } else {}
            }
        });
    });
    */
    $("#userPwcheck").change(function () {
        if ($("#userPwcheck").val() != $("#userPw").val()) {
            $("#userPwcheck").val('');
            $("#userPw").val('');
            alert("비밀번호가 다릅니다.");
        }
    });
});


$('#btn_insert').click(function () {
    $.ajax({
        type: 'POST',
        url: '보낼주소',
        data: JSON.stringify({
            userid: $("#memberform input[name=userid]").val(),
            userPw: $("#memberform input[name=userPw]").val(),
            userName: $("#memberform input[name=userName]").val(),
            address: $("#memberform input[name=address]").val(),
            phone: $("#memberform input[name=phone]").val()

        }),
        success: function (data) {
            alert("회원등록이 완료되었습니다.");
        },
        error: function (data) {
            alert("회원 등록 실패했습니다.")
        }
    });
});