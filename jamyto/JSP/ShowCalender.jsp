<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

  
<%
  // デフォルトのロケール、タイムゾーンを持つCalendarオブジェクトを生成
  // 日時はロケールとタイムゾーンに基づいた現在日時が保持
  //＝現在のマシン日付を管理したカレンダーオブジェクトを生成
  //（Calendarクラスのコピーではない!)
  Calendar cal=Calendar.getInstance();
  
  //calで管理している現在の年を取得
  int intYear=cal.get(Calendar.YEAR);
  
  //現在の月を取得
  //Calendar.MONTHは1月＝０（０～１１）
  //よってここで１を足して何月かを示す
  int intMonth=cal.get(Calendar.MONTH)+1;
  
  //現在の日を取得した上で、
  //set：第1引数にフィールド、第2引数に値を指定し、フィールドの値を設定
  //＝★カレンダー上で受け取った日付を１日【月初】にセットする★
  cal.set(Calendar.DATE,1);
  
  //【当年当月の１日の】曜日を取得した上で【1を引いて】【k】に代入
  //DAY_OF_WEEK ： 日曜が1で始まる1～7 の数字
  //DAY_OF_WEEK ： 日曜が１、土曜が７
  //結果、【ｋ】： 日曜が０、土曜が６
  int k=cal.get(Calendar.DAY_OF_WEEK)-1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<HTML><HEAD>
<TITLE>JSPサンプル</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Windows-31J">
<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">
</HEAD><BODY>
<H1>CALENDAR</H1>
<div class="head">
  <!--現在の年月を表示-->
  <span class="title"><%=intYear%>年<%=intMonth%>月</span>
</div>
<table>
  <tr>
    <!--TH : Table Header-->
    <th class="holiday">日</th>
    <th class="weekday">月</th>
    <th class="weekday">火</th>
    <th class="weekday">水</th>
    <th class="weekday">木</th>
    <th class="weekday">金</th>
    <th class="saturday">土</th>
  </tr>
  <%int d=1;
    //月内の間はループ
    while(cal.get(Calendar.MONTH)==intMonth-1){%>
  <tr>
    <!--必ず日曜～土曜の一週間分は処理をするループ-->
    <%for(int j=0;j<7;j++){%>
      <%
      //各曜日のクラス決定
      if(j==0){%>
        <td class="holiday">
      <%}else if(j==6){%>
        <td class="saturday">
      <%}else{%>
        <td class="weekday">
      <%}//■終了■各曜日のクラス決定%>
      
      <%
      //もしkが０（＝日曜）でなければkから１を引く
      //【ｋ】： 日曜が０、土曜が６
      //★★★  はじめの１日目を書き込む曜日の確定用  ★★★
      //★★★  ＝前月分の空枠  ★★★
      if(k!=0){
        k--;
      //もしkが０（＝日曜）なら、もし月内の間なら
      //★★★  月が不一致の場合は空白出力  ★★★
      }else if (cal.get(Calendar.MONTH)==intMonth-1){%>
        <!--変数ｄを一増やして日付表示-->
        <%=d++%>
        <!--一日先の日付にする-->
        <%cal.add(Calendar.DATE,1);%>
      <%}%>        <!--/***if(k!=0)-->
      </td>        <!--/***td(holiday,saturday,weekday)-->
    <%}%>          <!--/***for-->
  </tr>            <!--/***tr(外側-->
  <%}%>            <!--/***while-->
</table>
</BODY></HTML>
