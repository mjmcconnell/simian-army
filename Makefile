run-army:
	docker-compose run --rm --service-ports army ./gradlew jettyRun
