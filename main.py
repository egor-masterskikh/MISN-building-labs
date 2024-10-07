from jinja2 import Environment, FileSystemLoader, select_autoescape
import pypandoc
from pathlib import Path

env = Environment(
    loader=FileSystemLoader('.'),
    autoescape=select_autoescape()
)

paths = (
    'lab1/lab1.md',
    'lab2/lab2.md',
    'lab3/lab3.md',
)

for path in paths:
    template = env.get_template(path)
    pypandoc.convert_text(
        source=template.render(), format='md',
        outputfile=Path(path).with_suffix('.html'), to='html',
        extra_args=('--mathjax', '--standalone')
    )
