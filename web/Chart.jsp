<%--
  Created by IntelliJ IDEA.
  User: MajorTom
  Date: 2021/2/18
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>全球疫情信息统计</title>
    <script src="echarts.min.js"></script>
    <script src="world.js"></script>
</head>
<body>
<div id="box" style="width: 1960px;height: 1080px"></div>
<script type="text/javascript">
    window.onload = function () {
        var xmlHttp;
        if (window.XMLHttpRequest) {//浏览器兼容
            xmlHttp = new XMLHttpRequest();
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.open("GET", "/DataTranServlet", true);
        xmlHttp.send(null);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4) {//状态判断
                var text = xmlHttp.responseText;
                text.substring(1, text.length - 1)
                var countryArray = eval("(" + text + ")")
                var CountryData = []
                for (var i in countryArray){
                    for(var j in countryArray[i].country)//大洲内层循环
                    console.log(countryArray[i].country[j])
                }

            }
        }
    }
    var myChart = echarts.init(document.getElementById("box"))

    myChart.setOption({
        title: {
            text: "全球疫情信息统计",
            subtext: "Ho-Yu-Fung's First-Personal-Work",
            left: "center",
            textStyle: {
                fontSize: 26,
            }
        },
        backgroundColor: "#f7f7f7",
        series: [{
            type: "map",
            map: "world"
        }],
        tooltip: {
            triggerOn: 'mousemove',
            formatter: function () {

            }
        }
    })
</script>
</body>
</html>
