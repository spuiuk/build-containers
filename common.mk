CONTAINER_CMD ?=
ifeq ($(CONTAINER_CMD),)
	CONTAINER_CMD:=$(shell podman version >/dev/null 2>&1 && echo podman)
endif
ifeq ($(CONTAINER_CMD),)
	CONTAINER_CMD:=$(shell docker version >/dev/null 2>&1 && echo docker)
endif

BUILD_CMD:=$(CONTAINER_CMD) build $(BUILD_OPTS)
PUSH_CMD:=$(CONTAINER_CMD) push $(PUSH_OPTS)

