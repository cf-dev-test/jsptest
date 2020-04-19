<%@ page contentType="text/html;charset=UTF-8" %>
<% 
    String id="";
    String name ="";
    String userlogoffdisp="";
    String userlogindisp="";
    try{
        id=(String)session.getAttribute("id");
        if (id == null){
            id="";
            userlogindisp="none";
        } else {
            
            name =(String)session.getAttribute("name");
            userlogoffdisp="none";
    
        }
    } catch (Exception e){
        // id=""の場合にログインしてないと解釈するようにする為、ここでは処理なし
        userlogindisp="none";
    }

%>
<HTML>
    <HEAD>
        <meta charset="UTF-8"/>
    </HEAD>

    <body>
        <div class="result" id ="result"></div>

        <div id="userlogoff" style="display:<%=userlogoffdisp %>">
            <form id="form_1" method="post" accept-charset="utf-8" return false>
                <p>名前 <input type="text" name = "name" id ="name"> </p>
                <p>パスワード <input type="text" name = "password" id="password"> </p>
                <button type="button" id="login"">ログイン</button>
            </form>
        </div>
        <div id="userlogin" style="display:<%=userlogindisp %>">
            <form id="form_2" method="post" accept-charset="utf-8" return false>
                <p>名前 <input type="text" name = "name2" id ="name2" disabled value="<%=name %>"/> </p>
                <button type="button" id="logoff"">ログオフ</button>
            </form>
        </div>
        <script type="text/javascript">

            document.getElementById("login").onclick = function() {

                var xhr = new XMLHttpRequest();
                
                xhr.open('POST', './urlLogin');
                xhr.responseType="text";
                xhr.onreadystatechange = function() {

                
                    if(xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("result").innerHTML= xhr.responseText;
                        if (xhr.responseText.trim()=="ログインしました"){
                            document.getElementById("userlogoff").style.display ="none";
                            document.getElementById("userlogin").style.display ="";
                            document.getElementById("name2").value=document.getElementById("name").value;
                        }
                    }
                }

                xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8');
                xhr.send('name='+document.getElementById("name").value + '&password='+document.getElementById("password").value);

            };
            document.getElementById("logoff").onclick = function() {

                var xhr = new XMLHttpRequest();

                xhr.open('POST', './urlLogoff');
                xhr.onreadystatechange = function() {

                    if(xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("result").innerHTML="";
                        document.getElementById("userlogoff").style.display ="";
                        document.getElementById("userlogin").style.display ="none";
                        document.getElementById("name").value="";
                        document.getElementById("password").value="";
                    }
                }

                xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8');
                xhr.send();

            };
            /*
            // 以下のコードでも動くが、まだよく内容をわかってない
            $(function(){
                // Ajax button click
                $('#login').on('click',function(){
                    $.ajax({
                        url:'./urlLogin',
                        type:'POST',
                        data:{
                            'name':$('#name').val(),
                            'password':$('#password').val()
                        }
                    })
                    // Ajaxリクエストが成功した時発動
                    .done( (data) => {
                        $('.result').html(data);

                        if (data.trim()=="ログインしました"){
                            // まだ未熟なためメッセージで判定
                            document.getElementById("userlogoff").style.display ="none";
                            document.getElementById("userlogin").style.display ="";
                            document.getElementById("name2").value=$('#name').val();


                        }
                    })
                    // Ajaxリクエストが失敗した時発動
                    .fail( (data) => {
                        $('.result').html(data);
                    })
                    // Ajaxリクエストが成功・失敗どちらでも発動
                    .always( (data) => {
    
                    });
                });


                // Ajax button click
                $('#logoff').on('click',function(){
                    $.ajax({
                        url:'./urlLogoff',
                        type:'POST',
                    })
                    // Ajaxリクエストが成功した時発動
                    .done( (data) => {
                        $('.result').html(data);
                        document.getElementById("userlogoff").style.display ="";
                        document.getElementById("userlogin").style.display ="none";

                    })
                    // Ajaxリクエストが失敗した時発動
                    .fail( (data) => {
                        $('.result').html(data);
                    })
                    // Ajaxリクエストが成功・失敗どちらでも発動
                    .always( (data) => {
    
                    });
                });

            });
            */

        </script>
    </body>
</HTML>