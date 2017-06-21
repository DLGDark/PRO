function editInfo(obj) {    
    var tds= $(obj).parent().parent().find('td');  
    $('#mdyname').val(tds.eq(0).text());  
    // $('#mdysex').val(tds.eq(1).text());
    $('#mdyage').val(tds.eq(2).text());
    $('#mdyposition').val(tds.eq(3).text());
    $('#mdybirthday').val(tds.eq(4).text());
    $('#mdyphone').val(tds.eq(5).text());
    $('#mdyaddr').val(tds.eq(6).text());
    $('#mdyemail').val(tds.eq(7).text());

    var sex = tds.eq(1).text();   
    if (sex == '女') {    
        document.getElementById('mdysexwomen').checked = true;    
    } else {    
        document.getElementById('mdysexman').checked = true;    
    }
    $('#modifyModal').modal('show');   
}    
//提交更改    
function update() {    
    //获取模态框数据    
    var name = $('#mdyname').val();        
    var sex = $('input:radio[name="sex"]:checked').val();
    var age = $('#mdyage').val();
    var posi = $('#mdyposition').val();
    var birth = $('#mdybirthday').val();
    var addr = $('#mdyaddr').val();
    var email = $('#mdyemail').val();   
    $.ajax({    
        type: "post",    
        url: "",    
        data: "name=" + name + "&sex=" + sex + "&age=" + age + "&posi=" + posi+ "&birth=" + birth+ "&addr=" + addr +"&email=" + email,    
        dataType: 'html',    
        contentType: "application/x-www-form-urlencoded; charset=utf-8",    
        success: function(result) {    
            //location.reload();    
        }    
    });   
    $('#modal').modal('hide');    
}