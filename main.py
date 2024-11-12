from jinja2 import Environment, FileSystemLoader, select_autoescape
import pypandoc
from pathlib import Path

env = Environment(
    loader=FileSystemLoader('.'),
    autoescape=select_autoescape()
)

labs_to_render_count = 4

for i in range(labs_to_render_count):
    path = f'lab{i}/report.md'
    template = env.get_template(path)
    pypandoc.convert_text(
        source=template.render(), format='md',
        outputfile=Path(path).with_suffix('.html'), to='html',
        extra_args=('--mathjax', '--standalone')
    )
