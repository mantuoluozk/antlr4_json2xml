# antlr4_json2xml
本项目基于IDEA和jdk11，是antlr4权威指南书上的示例程序
* JSON.g4是json的词法规则和语法规则
* json2xml是转换程序和主函数，里面有t.json的路径
* t.json是待转换的json语言
* 其余函数是基于JSON.g4生成的词法分析器和语法分析器  

输入：
```
{
  "description" : "An imaginary server config file",
  "logs" : {"level":"verbose", "dir":"/var/log"},
  "host" : "antlr.org",
  "admin": ["parrt", "tombu"],
  "aliases": []
}

```
输出：
```
<description>An imaginary server config file</description>
<logs>
<level>verbose</level>
<dir>/var/log</dir>
</logs>
<host>antlr.org</host>
<admin>
<element>parrt</element>
<element>tombu</element>
</admin>
<aliases></aliases>
```
