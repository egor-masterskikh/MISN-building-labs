{% extends 'base.md' %}

{% block lab_num %}
  3<br>
  на лабораторной установке
{% endblock %}

{% block lab_title %}
  Изучение ИКМ кодека
{% endblock %}

{% block body %}

### Цель работы

- изучить принципы преобразования сигналов в системе связи с импульсно-кодовой модуляцией (ИКМ)
- изучить процессы аналого-цифрового и цифро-аналогового преобразования сигнала

## Изучить преобразование сигнала в системе связи с ИКМ

<figure style="width: 62%;">
  <img src="../images/signal_on_transmission_filter_input_S1_left.jpg" alt="">
  <figcaption>
    Сигнал на входе передающего фильтра (КТ1) при **левом** положении переключателя П1
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/signal_on_transmission_filter_input_S1_center.jpg" alt="">
  <figcaption>
    Сигнал на входе передающего фильтра (КТ1) при **среднем** положении переключателя П1
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/signal_on_transmission_filter_input_S1_left.jpg" alt="">
  <figcaption>
    Сигнал на входе передающего фильтра (КТ1) при **правом** положении переключателя П1
  </figcaption>
</figure>

<table>
  <thead>
  <tr>
    <td>Амплитуда сигнала на выходе передающего фильтра $U_\mathrm{вх}$, мВ</td>
    <td>Положение переключателя П1</td>
    <td>Амплитуда сигнала на выходе передающего фильтра $U_\mathrm{вых}$, мВ</td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td rowspan="3" align="center">50</td>
    <td>левое</td>
    <td></td>
  </tr>
  <tr>
    <td>среднее</td>
    <td></td>
  </tr>
  <tr>
    <td>правое</td>
    <td></td>
  </tr>
  </tbody>
</table>

<figure style="width: 62%;">
  <img src="../images/signals_on_transmission_filter_output_and_on_decoder_output.jpg" alt="">
  <figcaption>
    Верхний сигнал — на выходе передающего фильтра (КТ3), нижний — на выходе декодера (КТ7)
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/signal_on_transmission_filter_output_and_fsx_pulses.jpg" alt="">
  <figcaption>
    Верхний сигнал — на выходе передающего фильтра (КТ3), нижний — импульсы $F_\mathrm{SX}$ (КТ13)
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/signals_on_transmission_filter_output_and_on_receiving_filter_output.jpg" alt="">
  <figcaption>
    Верхний сигнал — на выходе передающего фильтра (КТ3), нижний — на выходе приёмного фильтра (КТ2)
  </figcaption>
</figure>

## Снять характеристику преобразования кодера

| Выходной код кодера | Напряжение на<br>входе кодера, В | Шаг внутри<br>сегмента, мВ |
| :-- | --: | --: |
{% for output_code, input_voltage, in_segment_step in coder_characteristic[1:] %}| {{ output_code }} | {{ input_voltage | float | fixed_precision(2) }} | {{ in_segment_step | float | fixed_precision(3) }} |
{% endfor %}

<figure style="width: 100%;">
  <img src="../images/coder_characteristic.svg">
  <figcaption>
    Передаточная характеристика кодера
  </figcaption>
</figure>

## Снять характеристику преобразования декодера

| Входной код декодера | Напряжение на<br>выходе декодера, В | Шаг внутри<br>сегмента, мВ |
| :-- | --: | --: |
{% for output_code, input_voltage, in_segment_step in decoder_characteristic[1:] %}| {{ output_code }} | {{ input_voltage | float | fixed_precision(2) }} | {{ in_segment_step | float | fixed_precision(3) }} |
{% endfor %}

<figure style="width: 100%;">
  <img src="../images/decoder_characteristic.svg">
  <figcaption>
    Передаточная характеристика декодера
  </figcaption>
</figure>

{% endblock %}