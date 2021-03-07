TAG_NAME_POT=translation_base

help:
	@echo "Study internationalization (i18n) and localization (l10n)"
	@echo "Setup Help"
	@echo
	@echo  "used: make <subcommand>"
	@echo  "subcommand used:"
	@echo  "    run_gettext     Run the command to extract the file for translation"
	@echo  "    run_pep     Run the command to analyze the code"

run_gettext:
	xgettext -o ${TAG_NAME_POT}.pot --output-dir=./example/locale/pot ./example/*.py 

run_msginit:
	msginit -i ./example/locale/pot/${TAG_NAME_POT}.pot -o ./example/locale/pt_BR/LC_MESSAGES/example.po -l pt_BR.UTF-8
	msginit -i ./example/locale/pot/${TAG_NAME_POT}.pot -o ./example/locale/en_US/LC_MESSAGES/example.po -l en_US.UTF-8

run_msgfmt:
	msgfmt ./example/locale/pt_BR/LC_MESSAGES/example.po -o ./example/locale/pt_BR/LC_MESSAGES/example.mo
	msgfmt ./example/locale/en_US/LC_MESSAGES/example.po -o ./example/locale/en_US/LC_MESSAGES/example.mo

run_translate_init: run_gettext run_msginit
	@echo ""
	@echo "Run the command to translation init"

run_translate_final: run_msgfmt
	@echo ""
	@echo "Run the command to translation final"

run_pep:
	@echo ""
	@echo "Run the command to format the code"
	black .
	@echo ""
	@echo "Run the command to style guide enforcement"
	flake8 .
	@echo ""

run_dev:
	LANG=pt_BR python ./example/main.py
	LANG=en_US python ./example/main.py