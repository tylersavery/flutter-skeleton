phony: gen, gen_watch, build_web

gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

gen_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

build_web:
	flutter build web --release

gen_seo:
	dart tools/gen_seo.dart

deploy:
	make build_web && make gen_seo && firebase deploy -f