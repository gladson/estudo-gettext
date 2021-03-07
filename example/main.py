import gettext
from pathlib import Path

app_name = Path(__file__).absolute().joinpath().parts[-2]
dir_name = Path().absolute().joinpath("example/locale")

list_langs = gettext.find(app_name, dir_name, all=True, languages=["pt_BR", "en_US"])


def isSupportedLang(listTranslate, lang):
    for item in listTranslate:
        if lang == item.split("/")[-3]:
            return lang
    return None


def UnsupportedLanguage(Exception):
    pass


if isSupportedLang(list_langs, "en_US"):
    # t = gettext.translation(domain=app_name, localedir=dir_name, languages=['pt_BR', 'en_US'])
    t = gettext.translation(domain=app_name, localedir=dir_name)
    _ = t.gettext

    hello = _("Hello, ")
    world = _("world!")

    print(hello + world)
else:
    raise UnsupportedLanguage("Language not found")
