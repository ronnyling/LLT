# robotframework-jsonlibrary
``JSONLibrary`` is a [Robot Framework](http://robotframework.org/) test library for manipulating [JSON](http://json.org/) Object. You can manipulate your JSON object using [JSONPath](http://goessner.net/articles/JsonPath/)

JSONPath is an expression which can help to access to your JSON document. The JSONPath structure is in the same way as XPath which use for accessing XML document. This is an example of JSONPath syntax.

| JSONPath | Description |
|----------|-------------|
| $        | the root object/element |
| @        | the current object/element |
| . or []  | child operator |
| ..       | recursive descent. JSONPath borrows this syntax from E4X |
| *        | wildcard. All objects/element regardless their names. |
| []       | subscript operator. XPath uses it to iterate over element collections and for predicates. In Javascript and JSON it is the native array operator. |
| [,]      | Union operator in XPath results in a combination of node sets. JSONPath allows alternate names or array indices as a set. |
| [start\: end\: step] | array slice operator borrowed from ES4 |
| ?()      | applies a filter (script) expression. |
| ()       | script expression, using the underlying script engine. |

This library can help you to add, get, update and delete your JSON object. So it's very useful in case that you have a very large JSON object.

# Usage
Install robotframework-jsonlibrary via ``pip`` command
```bash
pip install -U robotframework-jsonlibrary
```
# Example Test Case

*** Settings ***  |                     |                  |            |                  |
----------------- |-------------------- |----------------- |----------- |----------------- |
Library           | JSONLibrary         |                  |            |                  |
*** Test Cases ***|                     |                  |            |                  |
${json_obj}=      | Load JSON From File | example.json     |            |                  |
${object_to_add}= | Create Dictionary   | country=Thailand |            |                  |
${json_obj}=      | Add Object To Json  | ${json_obj}      | $..address | ${object_to_add} |
${value}=         | Get Value From Json | ${json_obj}      | $..country |                  |
|Should Be Equal As Strings | ${value[0]} | Thailand       |            |                  |
|${value_to_update}=| Set Variable     | Japan             |            |                  |
|${json_obj}=     | Update Value To Json | ${json_obj}     | $..country | ${value_to_update}|
|Should Be Equal As Strings | ${json_obj['country'] | ${value_to_update} |   |             |

# Documentation
For the detail keyword documentation. Go to this following link:

https://nottyo.github.io/robotframework-jsonlibrary/

#Help & Issues
Mention me on Twitter [@nottyo](https://twitter.com/nottyo) 



