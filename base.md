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
    БФУ им. И. Канта
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
    Выполнили студенты 3-го курса<br>
    направления «Информационная безопасность»<br>
    Мастерских Егор Александрович<br>
    Чернов Андрей Андреевич
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
