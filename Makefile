install-simian-army:
	docker-compose run --rm java git clone git://github.com/Netflix/SimianArmy.git && cd SimianArmy && $ ./gradlew build
