---
title: {{ self.lab_title() }}
lang: ru
---

<style>
  {% include 'style.css' %}
</style>

<div id="titlepage">
  <div>
  <h3>
    Балтийский Федеральный Университет им. Иммануила Канта
  </h3>

  <h2>
    Основы построения многоканальных инфокоммуникационных систем и сетей
  </h2>

  <h1>
    Отчёт по лабораторной работе №{% block lab_num %}{% endblock %}
  </h1>

  <h2>{% block lab_title %}{% endblock %}</h2>

  <br>

  <h4>
    Выполнил студент 3-го курса<br>
    направления «Информационная безопасность»<br>
    Мастерских Егор Александрович
  </h4>

  <h4>
    Преподаватель:<br>
    Молчанов Сергей Васильевич
  </h4>
  </div>

  <h3 id="footer">
    Калининград 2024
  </h3>
</div>

<div style="page-break-after: always;"></div>

{% block body %}{% endblock %}
