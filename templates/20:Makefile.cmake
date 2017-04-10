TARGET := ${1:a.out}
INSTALL_DIR := ${2:output}
$0
# ------------------------------------------------------------------------------

_BUILD_DIR := build
_CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)

.DEFAULT_GOAL := $(TARGET)
all: test install

.PHONY: setup
setup:
	@test -e $(_BUILD_DIR) || mkdir $(_BUILD_DIR)
	@cd $(_BUILD_DIR) && cmake $(_CMAKE_FLAGS) .. -G Ninja

.PHONY: $(TARGET)
$(TARGET): setup
	@ninja -C $(_BUILD_DIR)

.PHONY: install
install: $(TARGET)
	@ninja -C $(_BUILD_DIR) install

.PHONY: test
test: $(TARGET)
	@cd $(_BUILD_DIR) && ctest --verbose

.PHONY: clean
clean:
	@ninja -C $(_BUILD_DIR) clean

.PHONY: distclean
distclean:
	@rm -rf build.*

