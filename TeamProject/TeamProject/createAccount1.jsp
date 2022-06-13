<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="AC.css">

<script type="text/javascript">

var today = new Date();
var day = today.getDate();
var month = today.getMonth() + 1; //January is 0!
var year = today.getFullYear();

if (day < 10) {
   day = '0' + day;
}

if (month < 10) {
   month = '0' + month;
} 
    
today = year + '-' + month + '-' + day;
document.getElementById("dateId").setAttribute("max",today);

function onlyKorean(inputId) {
	var str=document.getElementById(inputId).value;
	for (i = -1; i < str.length; i++) {
		if (!((str.charCodeAt(i) > 0x3130 && str.charCodeAt(i) < 0x318F) || (str.charCodeAt(i) >= 0xAC00 && str.charCodeAt(i) <= 0xD7A3))) {

			alert("íê¸ë§ ìë ¥í´ ì£¼ì¸ì");
			document.getElementById(inputId).value=null; } }


	}

function test() {
	  var p1 = document.getElementById('ps1').value;
	  var p2 = document.getElementById('ps2').value;

	  if( p1 != p2 ) {
	    alert("ë¹ë°ë²í¸ê° ì¼ì¹ íì§ ììµëë¤");
	    return false;
	  } else{
	    //window.close();
	    
	    return true;
	  }

	}


//function idcheck(){
//	var form1=document.createAccount;
//	if(!form1.id.value){
//		alert("ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì");
//		form1.id.focus();
//		return false;
//	}
//	var user_id=form1.id.value;
//	
//	var url="idcheck2.jsp?id="+user_id;
//	window.open(url,"IdCheck","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=300,height=180");
//	return;
//}

</script>
int check=-1;
	var fid=id;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:/comp/env/jdbc/team");
		con=ds.getConnection();
		
		String sql="select id from project where id='"+fid+"'";
		st=con.createStatement();
		st.execute(sql);
		rs=st.executeQuery(sql);
		if(rs.next()){
			check=1;
		}else{
			check=0;
		}
	}
	finally{
		if(rs!=null)try{rs.close();}catch(SQLException err){}
		if(st!=null)try{st.close();}catch(SQLException err){}
	}
	if(check==1){
		%>
		<b><font color="red"><%=fid%></font>는 이미 사용중인 아이디입니다.</b>
		<form name="checkForm" method="post" action="createAccount.jsp">
		<b>다른 아이디를 입력해주세요.</b><br><br>
		
		</form>
		<%
	}else{
		%>
		<center>
		<b>사용가능한 아이디입니다.</b>
		<input type="button" value="닫기" onclick="setId()">
		</center>
		<script language="javascript">
		<%
	}
<title>íìê°ì</title>
</head>
<body>
<div class="register">
        <h3>íìê°ì</h3>
        <form action="CApro.jsp">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        ì´ë¦ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="name" id="inputkorean" onkeypress="javascript:return onlyKorean('inputkorean');" values="" placeholder="ì´ë¦ì ìë ¥íì¸ì" autofocus required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ìì´ë <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="text" name="id" pattern="[A-Za-z]+" placeholder="ììë¬¸ì 4ì~16ì" minlength="4" maxlength="16">
                    </li>
                    <li class="item">
                        <button class="idcheck" onclick="location.href='idcheck2.jsp'" required>ì¤ë³µíì¸</button>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ëë¤ì <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="nickname" id="inputkorean" values="" placeholder="ëë¤ìì ìë ¥íì¸ì" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ë¹ë°ë²í¸ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="password" name="pass" id="ps1" pattern="[A-Za-z]+" placeholder="ììë¬¸ì 4ì~16ì" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ë¹ë°ë²í¸ íì¸ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="password" name="passcheck" id="ps2" pattern="[A-Za-z]+" placeholder="ììë¬¸ì  4ì~16ì" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ìëìì¼ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="date" name="birth" id="dateId" min="1950-06-25" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <!--  
                <ul class="container">
                    <li class="item center">
                       
                        ì±ë³ 
                    </li>
                    <li class="item">
                        <select name="gender" id="" required="required">
                            <option value="ì í" selected>ì í</option>
                            <option value="ë¨ì±">ë¨ì±</option>
                            <option value="ì¬ì±">ì¬ì±</option>
                        </select>
                    </li>
                   
                    <li class="item">
                        
                    </li>
                </ul>
                  -->
                  <ul class="container">
                    <li class="item center">
                       
                        ì±ë³ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    	
						<li style="font-size: 14px;vertical-align: middle;">
						ë¨ ì±&nbsp&nbsp&nbsp<label><input type="radio" style="width:20px;height:20px;border:1;vertical-align: middle;" name="gender" value="male" required="required"></label>
						ì¬ ì±&nbsp&nbsp&nbsp<label><input type="radio" style="width:20px;height:20px;border:1;vertical-align: middle;" name="gender" value="female"></labal>
						</li>
						
						<li class="item"></li>


                </ul>
                <ul class="container">
                    <li class="item center">
                        ì íë²í¸ <img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="íì"/>
                    </li>
                    <li class="item">
                        <input type="tel" name="pnum" placeholder="-ë¹¼ê³  ìë ¥í´ì£¼ì¸ì." minlength="11" maxlength="11" pattern="[0-9]+" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        ì´ë©ì¼ 
                    </li>
                    <li class="item">
                        <input type="email" name="email" placeholder="ì´ë©ì¼ì ìë ¥í´ì£¼ì¸ì.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit" onclick="test()">ê°ìíê¸°</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit" onclick="self.close()">ì·¨ì</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
</body>
</html>