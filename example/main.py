import gettext
from pathlib import Path

app_name = Path(__file__).absolute().joinpath().parts[-2]
dirname = Path().absolute().joinpath("example/locale")

t = gettext.translation(app_name, dirname)
_ = t.gettext

hello = _("Hello, ")

world = _("world!")


print(hello + world)
print(gettext.find(app_name, dirname, all=True))
