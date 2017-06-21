function editInfo(obj,emp_id) {    
    var tds= $(obj).parent().parent().find('td');  
    $('#mdyname').val(tds.eq(0).text());  
    // $('#mdysex').val(tds.eq(1).text());
    $('#mdyage').val(tds.eq(2).text());
    $('#mdyposition').val(tds.eq(3).text());
    $('#mdybirthday').val(tds.eq(4).text());
    $('#mdyphone').val(tds.eq(5).text());
    $('#mdyaddr').val(tds.eq(6).text());
    $('#mdyemail').val(tds.eq(7).text());
    
    $('#nameId').val(emp_id);
    
    var sex = tds.eq(1).text();   
    if (sex == '女') {    
        document.getElementById('mdysexwomen').checked = true;    
    } else {    
        document.getElementById('mdysexman').checked = true;    
    }
    $('#modifyModal').modal('show');   
}    
/*//提交更改    
function update() {    
    //获取模态框数据    
    var name = $('#mdyname').val();        
    var sex = $('input:radio[name="sex"]:checked').val();
    var age = $('#mdyage').val();
    var posi = $('#mdyposition').val();
    var birth = $('#mdybirthday').val();
    var phone=$('#mdyphone').val();
    var addr = $('#mdyaddr').val();
    var email = $('#mdyemail').val();  
    
    var empId=$('#nameId').val();
    $.ajax({    
        type: "post",    
        url: "/ttms/employee/updateEmpInfo",    
        data: {"emp_id":empId,"emp_name":name,"emp_sex":sex,"emp_age":age,"ep_position":posi,"emp_dob":birth,"emp_tel":phone,"emp_addr":addr,"emp_email":email},    
        dataType: 'html',    
        contentType: "application/x-www-form-urlencoded; charset=utf-8",    
        success: function(result) {    
            //location.reload();    
        }    
    });   
    $('#modal').modal('hide');    
}*/