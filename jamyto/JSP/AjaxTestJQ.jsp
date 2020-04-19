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
        <div class="result"></div>

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
            // $("")
            // html要素 p h1 ul
            // id #main
            // class .result
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
                            //$('#userlogoff').css("display","none");
                            //$('#userlogin').css("display","");
                            
                            //$('#userlogoff').hide();
                            //$('#userlogin').show();
                            
                            $('#userlogoff').toggle();
                            $('#userlogin').toggle();

                            $('#name2').val($('#name').val());
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
                        //$('#userlogoff').css("display","");
                        //$('#userlogin').css("display","none");
                        
                        //$('#userlogoff').show();
                        //$('#userlogin').hide();
                        
                        $('#userlogoff').toggle();
                        $('#userlogin').toggle();

                        $('#name').val("");
                        $('#password').val("");
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

        </script>
    </body>
</HTML>