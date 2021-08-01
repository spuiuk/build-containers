include ../../common.mk

SERVER_REPO_NAME:=quay.io/spuiuk/centos8_gluster_build
SERVER_DIR:=.
SERVER_SRC_FILE:=Dockerfile

build:
	$(BUILD_CMD) --tag $(SERVER_REPO_NAME) -f $(SERVER_SRC_FILE) $(SERVER_DIR)

push:
	$(PUSH_CMD) $(SERVER_REPO_NAME)
