bash:
	docker compose run --rm web bash

test:
	docker compose run --rm web bash -c "rspec"

docker_run:
	docker compose run --rm -p 3000:3000 web