<%--
  Created by IntelliJ IDEA.
  User: fyt
  Date: 2023/6/27
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <meta name="Keywords" content="关键词,关键词">
    <meta name="description" content="">

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 12px;
            font-family: "微软雅黑";
            color: #666;
        }

        a {
            text-decoration: none;
        }

        ul li {
            list-style: none;
        }

        .tz_content {
            width: 100%;
            background: #282828;
        }

        /*t_left start*/
        .tz_content .t_left {
            width: 200px;
            height: 800px;
            background: #282828;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 2;
        }

        .tz_content .t_left .l_logo {
            width: 100%;
            height: 108px;
            border-bottom: 1px solid #000000;
            background: url("picture/logo1.png") no-repeat center;
        }

        .tz_content .t_left .l_nav {
            width: 100%;
            border-bottom: 1px solid #414141;
        }

        .tz_content .t_left .l_nav ul li {
            border-bottom: 1px solid #000000;
            line-height: 52px;
            border-top: 1px solid #414141;
        }

        .tz_content .t_left .l_nav ul li a {
            display: block;
            padding-left: 30px;
        }

        .tz_content .t_left .l_nav ul li a:hover {
            background: #28b779;
        }

        .tz_content .t_left .l_nav ul .active a {
            background: #28b779;
        }

        .tz_content .t_left .l_nav ul li a i {
            width: 16px;
            height: 16px;
            display: block;
            background: url("picture/ht_icon.png") no-repeat;
            float: left;
            margin-top: 20px;
        }

        .tz_content .t_left .l_nav ul li a .icon_1 {
            background-position: -233px -52px;
        }

        .tz_content .t_left .l_nav ul li a .icon_2 {
            background-position: -254px -52px;
        }

        .tz_content .t_left .l_nav ul li a .icon_3 {
            background-position: -211px -52px;
        }

        .tz_content .t_left .l_nav ul li a .icon_4 {
            background-position: -274px -52px;
        }

        .tz_content .t_left .l_nav ul li a .icon_5 {
            background-position: -295px -52px;
        }

        .tz_content .t_left .l_nav ul li a .icon_6 {
            background-position: -315px -52px;
            width: 19px;
            height: 6px;
            margin-top: 24px;
        }

        .tz_content .t_left .l_nav ul li a span {
            font-size: 14px;
            color: #fff;
            padding-left: 10px;
        }

        /*end t_left*/

        /*t_header start*/
        .tz_content .t_header {
            width: 100%;
            height: 56px;
            background: #2f3437;
            position: relative;
            z-index: 1;
        }

        /*h_nav start*/
        .tz_content .t_header .h_nav {
            height: 56px;
            margin-left: 200px;
            float: left;
        }

        .tz_content .t_header .h_nav ul li {
            float: left;
            width: 110px;
            height: 56px;
            border-left: 1px solid #414141;
            border-right: 1px solid #000;
        }

        .tz_content .t_header .h_nav ul li a {
            display: block;
            color: #838383;
            text-align: center;
            padding-top: 8px;
        }

        .tz_content .t_header .h_nav ul li a:hover {
            color: #fff;
        }

        .tz_content .t_header .h_nav ul li a i {
            display: block;
            width: 18px;
            height: 17px;
            background: url("picture/ht_icon.png") no-repeat;
            margin: 3px auto;
        }

        .tz_content .t_header .h_nav ul li .h_sel {
            color: #fff;
        }

        .tz_content .t_header .h_nav ul li a .h_icon1 {
            background-position: 0 -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon2 {
            background-position: -24px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon2 {
            background-position: -24px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon3 {
            background-position: -48px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon3 {
            background-position: -48px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon4 {
            background-position: -68px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon4 {
            background-position: -68px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon5 {
            background-position: -91px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon5 {
            background-position: -91px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon6 {
            background-position: -113px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon6 {
            background-position: -113px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon7 {
            background-position: -133px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon7 {
            background-position: -133px -25px;
        }

        .tz_content .t_header .h_nav ul li a .h_icon8 {
            background-position: -152px 0;
        }

        .tz_content .t_header .h_nav ul li a:hover .h_icon8 {
            background-position: -152px -25px;
        }

        /*end h_nav*/

        /*h_info start*/
        .tz_content .t_header .h_info {
            height: 56px;
            position: absolute;
            top: 0;
            right: 10px;
        }

        .tz_content .t_header .h_info .h_user {
            line-height: 56px;
            color: #fff;
            float: left;
        }

        .tz_content .t_header .h_info .h_out {
            width: 65px;
            height: 30px;
            background: #28b779;
            margin: 13px 5px 0 10px;
            float: right;
        }

        .tz_content .t_header .h_info .h_out a {
            display: block;
            line-height: 30px;
            color: #fff;
            padding-left: 10px;
        }

        .tz_content .t_header .h_info .h_out a span {
            float: left;
        }

        .tz_content .t_header .h_info .h_out a i {
            width: 14px;
            height: 14px;
            display: block;
            background: url("picture/ht_icon.png") no-repeat 0 -51px;
            float: left;
            margin: 6px 8px;
        }

        /*end h_info*/

        /*end header*/

        .tz_content .t_right {
            height: 1500px;
            background: #f3f4f5;
            margin-left: 200px;
        }

        /*r_location start*/
        .tz_content .t_right .r_location {
            height: 51px;
            background: #e5e5e5;
            border-bottom: 1px solid #ccc;
            line-height: 51px;
        }

        .tz_content .t_right .r_location i {
            width: 14px;
            height: 18px;
            display: block;
            background: url("picture/ht_icon.png") no-repeat;
            background-position: -16px -51px;
            float: left;
            margin: 16px 20px 0 20px;
        }

        /*end r_location*/

        /*r_message start*/
        .tz_content .t_right .r_message .m_list {
            height: 99px;
            float: left;
            margin-left: 1%;
            margin-top: 20px;
        }

        .tz_content .t_right .r_message .m_1 {
            width: 22%;
            background: #27a9e3;
        }

        .tz_content .t_right .r_message .m_2 {
            width: 16%;
            background: #28b779;
        }

        .tz_content .t_right .r_message .m_3 {
            width: 17%;
            background: #ffb848;
        }

        .tz_content .t_right .r_message .m_4 {
            width: 21%;
            background: #cc6a6a;
        }

        .tz_content .t_right .r_message .m_5 {
            width: 18%;
            background: #2255a4;
        }

        .tz_content .t_right .r_message .m_6 {
            width: 17%;
            background: #da542e;
        }

        .tz_content .t_right .r_message .m_7 {
            width: 20%;
            background: #2255a4;
        }

        .tz_content .t_right .r_message .m_8 {
            width: 18%;
            background: #6297bc;
        }

        .tz_content .t_right .r_message .m_9 {
            width: 20%;
            background: #27a9e3;
        }

        .tz_content .t_right .r_message .m_10 {
            width: 19%;
            background: #28b779;
        }

        .tz_content .t_right .r_message .m_list .m_pic {
            width: 44px;
            height: 46px;
            background: url("picture/ht_icon.png") no-repeat;
            float: left;
            margin: 25px 10px 0 20px;
        }

        .tz_content .t_right .r_message .m_list:hover {
            background: #2f3437;
        }

        .tz_content .t_right .r_message .m_list .m_desc {
            color: #fff;
            margin-top: 25px;
        }

        .tz_content .t_right .r_message .m_list .m_desc span {
            font-size: 24px;
        }

        .tz_content .t_right .r_message .m_1 .m_pic {
            background-position: 0 -76px;
        }

        .tz_content .t_right .r_message .m_2 .m_pic {
            background-position: -46px -77px;
        }

        .tz_content .t_right .r_message .m_3 .m_pic {
            background-position: -96px -77px;
        }

        .tz_content .t_right .r_message .m_4 .m_pic {
            background-position: -146px -77px;
        }

        .tz_content .t_right .r_message .m_5 .m_pic {
            background-position: -190px -77px;
        }

        .tz_content .t_right .r_message .m_6 .m_pic {
            background-position: -239px -77px;
        }

        .tz_content .t_right .r_message .m_7 .m_pic {
            background-position: -288px -77px;
        }

        .tz_content .t_right .r_message .m_8 .m_pic {
            background-position: -342px -77px;
        }

        .tz_content .t_right .r_message .m_9 .m_pic {
            background-position: -395px -77px;
        }

        .tz_content .t_right .r_message .m_10 .m_pic {
            background-position: -449px -77px;
        }

        /*end r_message*/


        /*清除浮动*/
        .clear {
            clear: both;
        }

        /*r_table start*/
        .tz_content .t_right .r_table {
            border: 1px solid #ccc;
            margin: 0 1% 0 1%;
            background: #fff;
            margin-top: 20px;
            padding-bottom: 10px;
        }

        .tz_content .t_right .r_table .r_title {
            width: 100%;
            height: 40px;
            background: #eee;
            border-bottom: 1px solid #ccc;
        }

        .tz_content .t_right .r_table .r_title i {
            width: 16px;
            height: 14px;
            display: block;
            background: url("picture/ht_icon.png") no-repeat -386px -15px;
            float: left;
            margin: 12px;
        }

        .tz_content .t_right .r_table .r_title p {
            height: 40px;
            line-height: 40px;
            border-left: 1px solid #ccc;
            float: left;
            padding-left: 5px;
            color: #000;
        }

        .tz_content .t_right .r_table .r_label {
            width: 80%;
            height: 100px;
            float: left;
        }

        .tz_content .t_right .r_table .r_label ul li {
            list-style: none;
            float: left;
            background: #999;
            margin: 10px 10px 0 10px;
        }

        .tz_content .t_right .r_table .r_label ul li a {
            display: block;
            padding: 8px 20px;
            color: #fff;
        }

        .tz_content .t_right .r_table .r_label ul li a:hover {
            background: #28b779;
        }

        .tz_content .t_right .r_table .r_label ul .select a {
            background: #28b779;
        }

        .tz_content .t_right .r_table .r_label ul li a i {
            width: 15px;
            height: 14px;
            display: block;
            background: url("picture/ht_icon.png") no-repeat;
            float: left;
            margin-right: 10px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon1 {
            background-position: -33px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon2 {
            background-position: -50px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon3 {
            background-position: -67px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon4 {
            background-position: -87px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon5 {
            background-position: -105px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon6 {
            background-position: -123px -52px
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon7 {
            background-position: -140px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon8 {
            background-position: -155px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon9 {
            background-position: -172px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon10 {
            background-position: -191px -52px;
        }

        .tz_content .t_right .r_table .r_label ul li a .l_icon11 {
            background-position: -212px -52px;
        }

        .tz_content .t_right .r_table .r_search {
            width: 19%;
            height: 30px;
            float: left;
            padding-top: 10px;
        }

        .tz_content .t_right .r_table .r_search .r_text {
            width: 60%;
            height: 28px;
            line-height: 28px;
            border: 1px solid #ddd;
            float: right;
        }

        .tz_content .t_right .r_table .r_search .r_btn {
            width: 20%;
            height: 29px;
            background: #999;
            color: #fff;
            cursor: pointer;
            border: 0;
            float: right;
        }

        /*end r_table*/

        /*r_table_list start*/
        .tz_content .t_right .r_table .r_table_list {
            width: 100%;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab {
            border-collapse: collapse;
            width: 98%;
            text-align: center;
            margin: 0 1%;
        }

        .tz_content .t_right .r_table .r_table_list tr th {
            line-height: 40px;
            background: #eee;
        }

        .tz_content .t_right .r_table .r_table_list tr td {
            border: 1px solid #ddd;
            line-height: 40px;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab thead {
            border: 1px solid #ddd;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr:hover {
            background: #EAEAEA;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr:hover .t_action {
            display: block;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action {
            width: 108px;
            height: 24px;
            margin: 0 auto;
            display: none;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr .t_td {
            width: 120px;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action a {
            width: 24px;
            height: 24px;
            display: block;
            float: left;
            margin-right: 2px;
            background: url("picture/ht_icon.png") no-repeat;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action a:hover {
            background-color: #2f3437;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action .a_see {
            background-position: -359px -45px;
            background-color: #6297bc;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action .a_edit {
            background-position: -379px -47px;
            background-color: #27a9e3;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action .a_save {
            background-position: -398px -47px;
            background-color: #28b779;
        }

        .tz_content .t_right .r_table .r_table_list .t_tab tbody tr td .t_action .a_del {
            background-position: -417px -48px;
            background-color: #ff912f;
        }

        /*end r_table_list*/



        /*头部导航和消息提示小于1360的时候 用下边的样式*/
        @media screen and (max-width:1360px) {

            /*h_nav start*/
            .tz_content .t_header .h_nav {
                margin-left: 200px;
            }

            .tz_content .t_header .h_nav ul li {
                width: 80px;
            }

            /*end h_nav*/

            .tz_content .t_right .r_message .m_list .m_pic {
                display: none;
            }

            .tz_content .t_right .r_message .m_list .m_desc {
                text-align: center;
            }
        }

        /*头部导航和左侧导航小于1024的时候 用下边的样式*/
        @media screen and (max-width:1024px) {

            /*t_left start*/
            .tz_content .t_left {
                width: 50px;
            }

            .tz_content .t_left .l_logo {
                height: 54px;
                background: url("picture/logo1.png") no-repeat center;
            }

            .tz_content .t_left .l_nav ul li a {
                padding-left: 16px;
                height: 52px;
            }

            .tz_content .t_left .l_nav ul li a span {
                display: none;
            }

            /*end t_left*/

            /*h_nav start*/
            .tz_content .t_header .h_nav {
                margin-left: 50px;
            }

            .tz_content .t_header .h_nav ul li {
                width: 60px;
            }

            .tz_content .t_header .h_nav ul li a span {
                display: none;
            }

            .tz_content .t_header .h_nav ul li a i {
                margin: 14px auto;
            }

            /*end h_nav*/

            .tz_content .t_header .h_info .h_user {
                display: none;
            }

            .tz_content .t_right {
                margin-left: 0;
            }

            .tz_content .t_right .r_location {
                margin-left: 50px;
            }

            .tz_content .t_right .r_message {
                margin-left: 50px;
            }

            .tz_content .t_right .r_table {
                margin-left: 60px;
            }

        }
    </style>

</head>

<body>


<div class="tz_content">
    <div class="t_right">
     <div class="r_location">
            <i></i>
            <p>您当前所在位置：首页 > 后台中心</p>
        </div>

        <div class="r_message">
            <div class="m_list m_1">
                <div class="m_pic"></div>
                <div class="m_desc">
                    <span>${userNmuber}</span>
                    <p>所有用户数</p>
                </div>
            </div>
            <div class="m_list m_2">
                <div class="m_pic"></div>
                <div class="m_desc">
                    <span>${categoryAllNumber}</span>
                    <p>所有商品种类数</p>
                </div>
            </div>
            <div class="m_list m_3">
                <div class="m_pic"></div>
                <div class="m_desc">
                    <span>${goodsAllNumber}</span>
                    <p>所有商品数</p>
                </div>
            </div>
            <div class="m_list m_4">
                <div class="m_pic"></div>
                <div class="m_desc">
                    <span>${goodsExistNumber}</span>
                    <p>所有已上架商品数</p>
                </div>
            </div>

            <div class="clear"></div>
        </div>

    </div>

</div>


</body>

</html>
<script>
    var del = document.getElementsByClassName('a_del')
    for (let i = 0; i < del.length; i++) {
        del[i].onclick = function () {
            del[i].parentNode.parentNode.parentNode.remove()
        }
    }
</script>