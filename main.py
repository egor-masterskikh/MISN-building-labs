from jinja2 import Environment, select_autoescape, FileSystemLoader
import pypandoc

loader = FileSystemLoader(['lab1', '.'])

env = Environment(
    loader=loader,
    autoescape=select_autoescape()
)

lab1_name = "Исследование временно-частотных характеристик сигналов разной формы и амплитудно-модулированных сигналов"

lab1 = env.get_template("report.md").render(
    lab_num=1,
    lab_name=lab1_name
)

output = pypandoc.convert_text(
    source=lab1, format='md',
    outputfile='lab1/lab1.html', to='html',
    extra_args=(
        '--mathjax',
        '--standalone',
        '-V', 'lang=ru',
        '--metadata', f'title={lab1_name}'
    )
)
