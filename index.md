---
title: Trading - 交易学习笔记
layout: default
---

# Trading - 交易学习笔记

## 奇衡DK-CAPITAL

{% assign capital_files = site.pages | where_exp: "item", "item.path contains 'QihengDK-CAPITAL'" %}

{% for page in capital_files %}
- [{{ page.title | default: page.name }}]({{ page.url | relative_url }})
{% endfor %}

## 其他

{% assign other_files = site.pages | where_exp: "item", "item.path contains '其他'" %}

{% for page in other_files %}
- [{{ page.title | default: page.name }}]({{ page.url | relative_url }})
{% endfor %}
