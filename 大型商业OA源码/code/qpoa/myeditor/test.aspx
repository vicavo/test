<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="qpoa._11.test" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
 
<!-- Styles -->
<link REL="stylesheet" TYPE="text/css" HREF="styles.css">

<SCRIPT>
<!--
var bLoad=false				
var pureText=true		//编辑的内容是纯文本，没有任何格式化信息
var bodyTag="<BODY MONOSPACE STYLE=\"font:11pt 宋体\">"
var bTextMode=false

public_description=new Editor

function Editor() {
  this.put_html=SetHtml;
  this.get_html=GetHtml;
}

//composition是一个Iframe, 用于显示动态编辑的内容。
function GetHtml() {
  if (bTextMode)  //如果是文本模式则只取内部文本，滤去TAG信息
//不过在这里可以看出来，该文件的大部分代码应是从别的地方 //借用的，其bTextMode与界面上"查看html源码"的含义不符
	           //而且bTextMode实际上根本没有用到
    return Composition.document.body.innerText 
  else {
    cleanHtml();    //清理Html中内容，如滤去一些无效的Font标记
    cleanHtml();    //
    return Composition.document.body.innerHTML;   
  }
}

function public_SetMyHtml(sVal) {
  if (bTextMode) 
    Composition.document.body.innerText=sVal 
  else 
    Composition.document.body.innerHTML=sVal
}

function SetHtml(sVal) {
  if (bTextMode) 
    Composition.document.body.innerText=sVal 
  else 
    Composition.document.body.innerHTML=sVal
}

function LoadModel()
{
  URL="modle.htm";
  loc_x=document.body.scrollLeft+event.clientX-event.offsetX-100;
  loc_y=document.body.scrollTop+event.clientY-event.offsetY+170;
  window.showModalDialog(URL,self,"edge:raised;scroll:1;status:0;help:0;resizable:1;dialogWidth:350px;dialogHeight:350px;dialogTop:"+loc_y+"px;dialogLeft:"+loc_x+"px");
}
// -->
</script>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<style type="text/css">
.p2{font-size:9pt;font-family:宋体;color:#000000;line-height:18px;}
.Slink{font-size:9pt;font-family:宋体;color:#333333;line-height:17px;letter-spacing:1px}

<!--
H3 {
	font-family: Arial, Helvetica, Verdana;
	font-size: 10pt;
	font-weight: bold;
}
H3.real {
	font-family: Arial, Helvetica, Verdana;
	font-size: 14pt;
	font-weight: bold;
}
-->
</STYLE>   
    
    
    
</head>
<body onload="SetIframe();bLoad=true;if(parent.document.Signature && parent.document.Signature.MText)Composition.document.body.innerHTML = parent.document.Signature.MText.value;" STYLE="margin:0pt;padding:1pt" >
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 621px; height: 165px">
            <tr>
                <td style="width: 37px">
                </td>
       <td style="width: 514px" style="word-break:break-all">
               <div class="yToolbar" ID="ParaToolbar">
  <div class="TBHandle"></div>
  <select ID="FontName" class="TBGen" TITLE="字体名" LANGUAGE="javascript" onchange="format('fontname',this[this.selectedIndex].value);">
    <option class="heading">字体
    <option value="宋体">宋体
    <option value="黑体">黑体
    <option value="楷体_GB2312">楷体
    <option value="仿宋_GB2312">仿宋
    <option value="MS Song">MS宋体
    <option value="MS Hei">MS黑体
    <option value="MingLiU">MingLiU
    <option value="Arial">Arial
    <option value="Arial Black">Arial Black
    <option value="Arial Narrow">Arial Narrow
    <option value="Bradley Hand ITC">Bradley Hand ITC
    <option value="Brush Script MT">Brush Script MT
    <option value="Century Gothic">Century Gothic
    <option value="Comic Sans MS">Comic Sans MS
    <option value="Courier">Courier
    <option value="Courier New">Courier New
    <option value="MS Sans Serif">MS Sans Serif
    <option value="Script">Script
    <option value="System">System
    <option value="Times New Roman">Times New Roman
    <option value="Viner Hand ITC">Viner Hand ITC
    <option value="Verdana">Verdana
    <option value="Wide Latin">Wide Latin
    <option value="Wingdings">Wingdings
  </select>
  <select ID="FontSize" class="TBGen" TITLE="字号大小" LANGUAGE="javascript" onchange="format('fontsize',this[this.selectedIndex].value);">
    <option class="heading">字号
    <option value="1">一号
    <option value="2">二号
    <option value="3">三号
    <option value="4">四号
    <option value="5">五号
    <option value="6">六号
    <option value="7">七号
  </select>
  <select ID="ForeColor" class="TBGen" TITLE="字体色彩" LANGUAGE="javascript" onchange="format('forecolor',this[this.selectedIndex].value);">
    <option class="heading" selected>字色
    <option style="COLOR: red" value="red">红色
    <option style="COLOR: blue" value="blue">蓝色
    <option style="COLOR: green" value="green">绿色
    <option style="COLOR: yellow" value="yellow">黄色
    <option style="COLOR: pink" value="pink">粉红
    <option style="COLOR: cyan" value="cyan">天青
    <option style="COLOR: white" value="white">白色
    <option style="COLOR: darkred" value="darkred">深红
    <option style="COLOR: darkblue value="darkblue">深蓝
    <option style="COLOR: darkgreen" value="darkgreen">深绿
    <option style="COLOR: darkyellow" value="darkyellow">土黄
    <option style="COLOR: darkcyan" value="darkcyan">蓝绿
    <option style="COLOR: gray" value="gray">浅灰
    <option style="COLOR: black" value="black">黑色
  </select>
  <select ID="BackColor" class="TBGen" TITLE="字体背景色彩" LANGUAGE="javascript" onchange="format('backcolor',this[this.selectedIndex].value);">
    <option class="heading">背景色
    <option style="COLOR: red" value="red">红色
    <option style="COLOR: blue" value="blue">蓝色
    <option style="COLOR: green" value="green">绿色
    <option style="COLOR: yellow" value="yellow">黄色
    <option style="COLOR: pink" value="pink">粉红
    <option style="COLOR: cyan" value="cyan">天青
    <option style="COLOR: white" value="white">白色
    <option style="COLOR: darkred" value="darkred">深红
    <option style="COLOR: darkblue value="darkblue">深蓝
    <option style="COLOR: darkgreen" value="darkgreen">深绿
    <option style="COLOR: darkyellow" value="darkyellow">土黄
    <option style="COLOR: darkcyan" value="darkcyan">蓝绿
    <option style="COLOR: gray" value="gray">浅灰
    <option style="COLOR: black" value="black">黑色
  </select>
 <div class="TBSep"></div>
  <div class="Btn" TITLE="加粗" LANGUAGE="javascript" onclick="format('bold');">
    <img class="Ico" src="imgs/bold.gif">
  </div>
  <div class="Btn" TITLE="斜体" LANGUAGE="javascript" onclick="format('italic')">
    <img class="Ico" src="imgs/italic.gif">
  </div>
  <div class="Btn" TITLE="下划线" LANGUAGE="javascript" onclick="format('underline')">
    <img class="Ico" src="imgs/under.gif">
  </div>
  <div class="Btn" TITLE="模版" LANGUAGE="javascript" onclick="LoadModel()" style="width:30pt">
    <img class="Ico" src="imgs/model.gif" style="width:30pt; height:15pt">
  </div>
</div>

<div class="yToolbar" ID="FormatToolbar">
  <div class="TBHandle"></div>
  <div class="Btn" TITLE="插入超级链接" LANGUAGE="javascript" onclick="createLink()">
    <img class="Ico" src="imgs/wlink.gif">
  </div>
  <div class="Btn" TITLE="剪切" LANGUAGE="javascript" onclick="format('cut')">
    <img class="Ico" src="imgs/cut.gif">
  </div>
  <div class="Btn" TITLE="复制" LANGUAGE="javascript" onclick="format('copy')">
    <img class="Ico" src="imgs/copy.gif">
  </div>
  <div class="Btn" TITLE="粘贴" LANGUAGE="javascript" onclick="format('paste')">
    <img class="Ico" src="imgs/paste.gif">
  </div>

  <div class="TBSep"></div>

  <div class="Btn" TITLE="左对齐" NAME="Justify" LANGUAGE="javascript" onclick="format('justifyleft')">
    <img class="Ico" src="imgs/aleft.gif">
  </div>
  <div class="Btn" TITLE="居中" NAME="Justify" LANGUAGE="javascript" onclick="format('justifycenter')">
    <img class="Ico" src="imgs/center.gif">
  </div>
  <div class="Btn" TITLE="右对齐" NAME="Justify" LANGUAGE="javascript" onclick="format('justifyright')">
    <img class="Ico" src="imgs/aright.gif">
  </div>
  <div class="TBSep"></div>
  <div class="Btn" TITLE="编号" LANGUAGE="javascript" onclick="format('insertorderedlist')">
    <img class="Ico" src="imgs/nlist.gif">
  </div>
  <div class="Btn" TITLE="项目符号" LANGUAGE="javascript" onclick="format('insertunorderedlist')">
    <img class="Ico" src="imgs/blist.gif">
  </div>
  <div class="TBSep"></div>
  <div class="Btn" TITLE="减少缩进量" LANGUAGE="javascript" onclick="format('outdent')">
    <img class="Ico" src="imgs/ileft.gif">
  </div>
  <div class="Btn" TITLE="增加缩进量" LANGUAGE="javascript" onclick="format('indent')">
    <img class="Ico" src="imgs/iright.gif" >
  </div>
  <div ID="EditMode" class="TBGen" style="width:150" TITLE="编辑模式">
    <input type=checkbox name="switchMode" id="switchMode" LANGUAGE="javascript" onclick="setMode(switchMode.checked)">        
<label for="switchMode">编辑HTML源文件</label>
  </div>
</div>

<IFRAME class="Composition" width="100%" ID="Composition" height="200">
  
</IFRAME>
  <input id="Button2" type="button" value="button" onclick="SetIframe() "/><asp:TextBox
      ID="TextBox2" runat="server"></asp:TextBox>
<SCRIPT>
<!--
Composition.document.open();
Composition.document.write(bodyTag);
Composition.document.close();
Composition.document.designMode="On";
Composition.focus();

setTimeout("Composition.focus()",0)



// -->

        function   SetIframe()  
          {  
          setTimeout("SetIframe()",0);
                  var   content=document.getElementById("Composition").contentWindow.document.body.innerHTML;  
                  document.getElementById("TextBox1").value=content;  
          }   


</SCRIPT>

<script LANGUAGE="Javascript" SRC="compose.js">
</script>

                
                
                
                
                </td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:TextBox ID="TextBox1" runat="server" Height="203px" TextMode="MultiLine" Width="613px"></asp:TextBox>
    </form>
</body>
</html>
