<style>
  tbody {
    border: none;
  }

  td:first-child {
    border-left: 1px solid;
  }
  td {
    border-right: 1px solid;
  }

  tr:first-child {
    border-top: 1px solid;
  }
  tr {
    border-bottom: 1px solid;
  }

  .columns tbody, .columns td, .columns tr {
    border: none !important;
  }

  figure {
    display: table;
    margin: 0;
  }

  figure img, figcaption {
    display: table-row;
  }
</style>

## Основы построения многоканальных инфокоммуникационных систем и сетей

# Отчёт по ЛР №1

Выполнил Мастерских Егор, студент группы ИБ-3

## Задание 1: проанализировать синусоидальный сигнал в частотной и временной областях при частотах дискретизации $f_\text{d}$: по условию теоремы Котельникова и при передискретизации с коэффициентами $10$ и $100$

<figure style="width: 50%;">
  <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/4fee40c85f4c5be91096a3c488105ed9415cc6f6/images/task1/task1_diagram.svg"/>
  <figcaption>
    Схема подключения блоков для анализа синусоидального сигнала
  </figcaption>
</figure>

Пусть $f_0 = 100\ \text{Hz}$ ($f_0$ — частота сигнала; ей соответствует параметр *Frequency* блока *Sine Wave*).

### Анализ сигнала при $f_{\text{d}0} = 1\ \text{kHz}$

Частота дискретизации $f_{\text{d}0}$ удовлетворяет условию теоремы Котельникова: $f_{\text{d}0} > 2f_0$

Установим значение параметра *Sample time* блока *Sine Wave* равным $\frac{1}{f_{\text{d}0}} = 1 \ \text{ms}$:

| | |
| -- | -- |
| Sample time | 1/1000 |

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd1k_time.png"/>
      Временная диаграмма синусоидального сигнала при $f_{\text{d}0}$. По диаграмме период сигнала $T = 0,01\ \text{s}$
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd1k_freq.png"/>
      Частотная диаграмма синусоидального сигнала при $f_{\text{d}0}$. По диаграмме $f_0 = 100\ \text{Hz}$
    </td>
  </tr>
</table>

### Анализ сигнала при $f_{\text{d}1} = 10f_{\text{d}0} = 10\ \text{kHz}$

| | |
| -- | -- |
| Sample time | 1/10000 |

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd10k_time.png"/>
      Временная диаграмма синусоидального сигнала при $f_{\text{d}1}$.
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd10k_freq.png"/>
      Частотная диаграмма синусоидального сигнала при $f_{\text{d}1}$.
    </td>
  </tr>
</table>

### Анализ сигнала при $f_{\text{d}2} = 100\ \text{kHz}$

| | |
| -- | -- |
| Sample time | 1/100000 |

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd100k_time.png"/>
      Временная диаграмма синусоидального сигнала при $f_{\text{d}2}$.
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task1/task1_fd100k_freq.png"/>
      Частотная диаграмма синусоидального сигнала при $f_{\text{d}2}$.
    </td>
  </tr>
</table>

### Выводы к заданию 1

- Чем выше частота дискретизации, тем ближе дискретный синусоидальный сигнал к своему аналоговому прототипу;
- $f_0 \ne f_0(f_\text{d})$ (изменение частоты дискретизации синусоидального сигнала не влияет на частоту этого сигнала);
- С каждым десятикратным увеличением $f_\text{d}$ пик основной частоты ($f_0$) на частотной диаграмме становится всё менее выраженным.

### О выборе значений частоты дискретизации ($f_\text{d}$) и частоты сигнала ($f_0$)

Наилучший результат от преобразования Фурье получается в случае, если:

$\dfrac{f_\text{d}}{f_\text{0}} = 2^n$, где $n \in \mathbb{N}$

## Задание 2: продемонстрировать умножение двух идентичных синусоидальных сигналов с частотой $f_0 = 1\ \text{kHz}$ при двух значениях коэффициента модуляции $k_\text{m}$

<figure style="width: 75%;">
  <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/4fee40c85f4c5be91096a3c488105ed9415cc6f6/images/task2/task2_diagram.svg"/>
  <figcaption>
    Схема подключения блоков для анализа операции умножения двух идентичных синусоидальных сигналов и коэффициента модуляции
  </figcaption>
</figure>

Пусть $A = 1$, $f_\text{d} = 128\ \text{kHz}$, где:

- $A$ — амплитуда генерируемого источником сигнала;
- $f_\text{d}$ — частота дискретизации.

### Анализ результирующего сигнала при $k_\text{m} = 2$

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task2/task2_k2_time.png"/>
      Временная диаграмма результирующего сигнала при $k_\text{m} = 2$. По диаграмме период результирующего сигнала $T^\prime = 0,5\ \text{ms}$; амплитуда результирующего сигнала $A^\prime = 2$
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task2/task2_k2_freq.png"/>
      Частотная диаграмма результирующего сигнала при $k_\text{m} = 2$. По диаграмме частота результирующего сигнала $f_0^\prime = 2\ \text{kHz}$
    </td>
  </tr>
</table>

### Анализ результирующего сигнала при $k_\text{m} = 3$

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task2/task2_k3_time.png"/>
      Временная диаграмма результирующего сигнала при $k_\text{m} = 3$. По диаграмме $T^\prime = 0,5\ \text{ms}$, $A^\prime = 3$
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task2/task2_k3_freq.png"/>
      Частотная диаграмма результирующего сигнала при $k_\text{m} = 3$. По диаграмме $f_0^\prime = 2\ \text{kHz}$
    </td>
  </tr>
</table>

### Выводы к заданию 2

- $f_0^\prime = 2f_0$;
- $A^\prime = k_\text{m}A^2$;
- $f_0^\prime \ne f_0^\prime(k_\text{m})$ ($f_0^\prime$ не зависит от $k_\text{m}$)

## Задание 3: изучить поведение треугольного и прямоугольного сигналов с произвольными характеристиками в частотной и временной областях

Пусть $f_\text{d} = 512\ \text{kHz}$ ($f_\text{d}$ — частота дискретизации и для прямоугольного, и для треугольного сигнала).

### Параметры прямоугольного сигнала

Пусть:

- $f_\text{p} = 1\ \text{kHz}$ ($f_\text{p}$ — частота прямоугольного сигнала);
- $w_\text{p} = \frac{T_\text{p}}{4}$ ($w_\text{p}$ — ширина импульса);

Соответствующая конфигурация блока *Pulse Generator*:

| | |
| -- | -- |
| Pulse type | Sample based |
| Sample time | 1/512000 |
| Period (number of samples) | 512 |
| Pulse width (number of samples) | 128 |

### Параметры треугольного сигнала

Пусть частота треугольного сигнала $f_\text{t} = 2\ \text{kHz}$.

Соответствующая конфигурация блока *Triangle Generator*:

| | |
| --- | --- |
| Sample time | 1/512000 |
| Frequency (Hz) | 2000 |

### Временной анализ прямоугольного и треугольного сигналов

<table class="columns">
  <tr>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/4fee40c85f4c5be91096a3c488105ed9415cc6f6/images/task3/task3_time_diagram.svg"/>
      Схема подключения блоков для временного анализа прямоугольного и треугольного сигналов
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task3/task3_time.png"/>
      Временная диаграмма прямоугольного и треугольного сигналов. По диаграмме $T_\text{p} = 1\ \text{ms}$; $T_\text{t} = 0,5\ \text{ms}$
    </td>
  </tr>
</table>

### Частотный анализ прямоугольного сигнала

<table class="columns">
  <tr>
    <td width="55%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/4fee40c85f4c5be91096a3c488105ed9415cc6f6/images/task3/task3_rect_freq_diagram.svg"/>
      Схема подключения блоков для частотного анализа прямоугольного сигнала
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task3/task3_rect_freq.png"/>
      Частотная диаграмма прямоугольного сигнала. По диаграмме $f_\text{p} = 1\ \text{kHz}$, последующие пики соответствуют гармоникам
    </td>
  </tr>
</table>

### Частотный анализ треугольного сигнала

<figure style="width: 50%;">
  <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/4fee40c85f4c5be91096a3c488105ed9415cc6f6/images/task3/task3_tri_freq_diagram.svg">
  <figcaption>
    Схема подключения блоков для частотного анализа треугольного сигнала
  </figcaption>
</figure>

<table class="columns">
  <tr valign="top">
    <td width="50%">
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task3/task3_tri_freq.png"/>
      Частотная диаграмма треугольного сигнала. По диаграмме $f_\text{t} = 2\ \text{kHz}$, последующие пики соответствуют гармоникам
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/egor-masterskikh/MISN-building-labs/refs/heads/main/images/task3/task3_tri_harms.png"/>
      Частотная диаграмма треугольного сигнала с бо́льшим количеством гармоник
    </td>
  </tr>
</table>

### Выводы к заданию 3

Ввиду того, что прямоугольный и треугольный сигналы не являются гармоническими, на их частотных диаграммах присутствуют гармоники. Частоте сигнала соответствует самый высокий пик (наибольшая мощность) на частотной диаграмме.
