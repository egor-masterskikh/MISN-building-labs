{% extends 'base.md' %}

{% block lab_num %}
  2<br>
  на лабораторной установке
{% endblock %}

{% block lab_title %}
  Исследование процессов коммутации и оценка помехоустойчивости систем связи с временным уплотнением каналов, использующих сигналы с АИМ и ИКМ
{% endblock %}

{% block body %}

### Цели работы

- изучить принципы работы мультиплексора и демультиплексора
- исследовать работу мультиплексора и демультиплексора при временном уплотнении линии связи АИМ- и ИКМ- сигналами
- качественно оценить помехоустойчивость систем связи с АИМ и
ИКМ

## Исследовать процесс формирования группового сигнала в системе связи с АИМ

<figure style="width: 62%;">
  <img src="../images/PAM/schemes/channel.svg" alt="">
  <figcaption>
    схема канала в системе связи с АИМ
  </figcaption>
</figure>

<table class="columns">
<tr valign="top">
  <td>
    <figure>
      <img src="../images/PAM/input_signal_1_and_strobing_pulses.jpg">
      <figcaption>
        входной сигнал №1 и стробирующие импульсы
      </figcaption>
    </figure>
  </td>
  <td style="width: 51%;">
    <figure>
      <img src="../images/PAM/PAM_signal_1.jpg">
      <figcaption>
        АИМ сигнала №1
      </figcaption>
    </figure>
  </td>
</tr>
</table>

<table class="columns">
<tr valign="top">
  <td>
    <figure>
      <img src="../images/PAM/input_signal_2_and_strobing_pulses.jpg" alt="">
      <figcaption>
        входной сигнал №2 и стробирующие импульсы
      </figcaption>
    </figure>
  </td>
  <td style="width: 51%;">
    <figure>
      <img src="../images/PAM/PAM_signal_2.jpg">
      <figcaption>
        АИМ сигнала №2
      </figcaption>
    </figure>
  </td>
</tr>
</table>

<table class="columns">
<tr valign="top">
  <td>
    <figure>
      <img src="../images/PAM/input_signal_3_and_strobing_pulses.jpg" alt="">
      <figcaption>
        входной сигнал №3 и стробирующие импульсы
      </figcaption>
    </figure>
  </td>
  <td style="width: 51%;">
    <figure>
      <img src="../images/PAM/PAM_signal_3.jpg">
      <figcaption>
        АИМ сигнала №3
      </figcaption>
    </figure>
  </td>
</tr>
</table>

<div class="nobreak">

<figure style="width: 62%;">
  <img src="../images/PAM/schemes/transmitter.svg" alt="">
  <figcaption>
    схема формирования группового сигнала
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/input_group_signal.jpg" alt="">
  <figcaption>
    групповой АИМ-сигнал на выходе мультиплексора
  </figcaption>
</figure>

</div>

<div class="nobreak">

## Исследовать процесс разделения каналов в системе связи с АИМ

<figure style="width: 62%;">
  <img src="../images/PAM/schemes/receiver.svg" alt="">
  <figcaption>
    схема разделения каналов в системе связи с АИМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/output_group_signal.jpg" alt="">
  <figcaption>
    групповой АИМ-сигнал на входе демультиплексора
  </figcaption>
</figure>

</div>

<figure style="width: 62%;">
  <img src="../images/PAM/output_signal_1.jpg" alt="">
  <figcaption>
    выходной сигнал №1 в системе связи с АИМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/output_signal_2.jpg" alt="">
  <figcaption>
    выходной сигнал №2 в системе связи с АИМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/output_signal_3.jpg" alt="">
  <figcaption>
    выходной сигнал №3 в системе связи с АИМ
  </figcaption>
</figure>

<div class="nobreak">

## Оценить помехоустойчивость системы связи с АИМ

<figure style="width: 62%;">
  <img src="../images/PAM/schemes/noise_impact.svg" alt="">
  <figcaption>
    схема анализа влияния шума на групповой сигнал в системе связи с АИМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/input_and_output_group_signal_with_noise.jpg" alt="">
  <figcaption>
    групповой сигнал до и после воздействия шума в системе связи с АИМ
  </figcaption>
</figure>

</div>

<div class="nobreak">

<figure>
  <img src="../images/PAM/schemes/input_and_output_signal.svg" alt="">
  <figcaption>
    схема анализа соответствующих входного и выходного сигналов в системе связи с АИМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PAM/input_and_output_signal_1.jpg" alt="">
  <figcaption>
    входной и выходной сигнал №1 в системе связи с АИМ
  </figcaption>
</figure>

</div>

<div class="nobreak">

## Исследовать процесс формирования группового сигнала в системе связи с ИКМ

<figure style="width: 62%;">
  <img src="../images/PCM/schemes/channel.svg" alt="">
  <figcaption>
    схема канала в системе связи с ИКМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/PCM_signal_1_and_strobing_pulses.jpg" alt="">
  <figcaption>
    ИКМ сигнала №1 и соответствующие стробирующие импульсы
  </figcaption>
</figure>

</div>

<figure>
  <img src="../images/PCM/schemes/input_and_output_signal.svg" alt="">
  <figcaption>
    схема анализа соответствующих входного и выходного сигналов в системе связи с ИКМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/input_and_output_signal_1.jpg" alt="">
  <figcaption>
    входной и выходной сигнал №1 в системе связи с ИКМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/input_and_output_signal_2.jpg" alt="">
  <figcaption>
    входной и выходной сигнал №2 в системе связи с ИКМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/input_and_output_signal_3.jpg" alt="">
  <figcaption>
    входной и выходной сигнал №3 в системе связи с ИКМ
  </figcaption>
</figure>

<div class="nobreak">

## Оценить помехоустойчивость системы связи с ИКМ

<figure style="width: 75%;">
  <img src="../images/PCM/schemes/noise_impact.svg" alt="">
  <figcaption>
    схема анализа группового сигнала до и после воздействия шума в системе связи с ИКМ
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/group_signal_before_and_after_noise.jpg" alt="">
  <figcaption>
    групповой сигнал до и после воздействия шума в системе связи с ИКМ
  </figcaption>
</figure>

</div>

<div class="nobreak">

<figure style="width: 75%;">
  <img src="../images/PCM/schemes/noise_impact_with_threshold_device.svg" alt="">
  <figcaption>
    схема анализа группового сигнала до воздействия шума и после прохождения через пороговое устройство
  </figcaption>
</figure>

<figure style="width: 62%;">
  <img src="../images/PCM/group_signal_before_noise_and_after_threshold_device.jpg" alt="">
  <figcaption>
    групповой сигнал до воздействия шума и после прохождения через пороговое устройство
  </figcaption>
</figure>

</div>

<div class="nobreak">

## Итоги

- изучили принципы построения устройств, позволяющих осуществлять временное уплотнение каналов связи
- исследовать работу мультиплексора и демультиплексора при временном уплотнении линии связи АИМ- и ИКМ- сигналами
- выяснили, что использование ИКМ и порогового устройства обеспечило бóльшую помехоустойчивость по сравнению с АИМ в представленной системе связи

</div>

{% endblock %}
