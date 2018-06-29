build:
	bash -c ' \
	  MAKE_CURRENT_BRANCH_NAME=$$(git rev-parse --abbrev-ref HEAD); \
	  [[ -z "$${MAKE_DOCKER_BRANCH_NAME_PROMPT// }" ]] && MAKE_DOCKER_BRANCH_NAME_PROMPT="$$MAKE_CURRENT_BRANCH_NAME"; \
	  echo "TAG (default <latest>):"; \
	  read MAKE_DOCKER_BUILD_TAG_PROMPT; \
	  [[ -z "$${MAKE_DOCKER_BUILD_TAG_PROMPT// }" ]] && MAKE_DOCKER_BUILD_TAG_PROMPT="latest"; \
	  echo "docker build -t thepry/docker-ansible:$$MAKE_DOCKER_BUILD_TAG_PROMPT ."; \
	  docker build -t thepry/docker-ansible:$$MAKE_DOCKER_BUILD_TAG_PROMPT . \
	';

docker-push:
	bash -c ' \
	  MAKE_CURRENT_BRANCH_NAME=$$(git rev-parse --abbrev-ref HEAD); \
	  [[ -z "$${MAKE_DOCKER_BRANCH_NAME_PROMPT// }" ]] && MAKE_DOCKER_BRANCH_NAME_PROMPT="$$MAKE_CURRENT_BRANCH_NAME"; \
	  echo "TAG (default <latest>):"; \
	  read MAKE_DOCKER_BUILD_TAG_PROMPT; \
	  [[ -z "$${MAKE_DOCKER_BUILD_TAG_PROMPT// }" ]] && MAKE_DOCKER_BUILD_TAG_PROMPT="latest"; \
	  echo "docker push thepry/docker-ansible:$$MAKE_DOCKER_BUILD_TAG_PROMPT"; \
	  docker push thepry/docker-ansible:$$MAKE_DOCKER_BUILD_TAG_PROMPT \
	';
