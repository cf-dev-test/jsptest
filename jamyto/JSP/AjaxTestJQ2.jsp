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
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>

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
                    $.post('./urlLogin',{
                        name:$('#name').val(),
                        password:$('#password').val()
                        }
                        ,function(data){
                            $('.result').html(data);  
                            if (data.trim()=="ログインしました"){
                                           
                                $('#userlogoff').toggle();
                                $('#userlogin').toggle();
                                $('#name2').val($('#name').val());
                            }
                        }
                    );
                });

                $('#logoff').on('click',function(){
                    $.post('./urlLogoff',{}
                        ,function(data){
                            $('.result').html(data);             
                            $('#userlogoff').toggle();
                            $('#userlogin').toggle();
                            $('#name').val("");
                            $('#password').val("");
                        }
                    );
                });
            });
        </script>
    </body>
</HTML>