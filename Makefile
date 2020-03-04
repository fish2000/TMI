
SCHEMA_DIR = schemas
SCHEMA_LNG = c++
SCHEMA_OUT = $(SCHEMA_DIR)/schemas-$(SCHEMA_LNG)
SCHEMA_INC = -I/usr/local/opt/capnp/include
SCHEMA_CMD = capnp compile --verbose $(SCHEMA_INC) -o$(SCHEMA_LNG):$(SCHEMA_OUT) --src-prefix=$(SCHEMA_DIR)

SCHEMAS := $(wildcard $(SCHEMA_DIR)/*.capnp)
ARTIFACT_PATH := $(SCHEMAS:$(SCHEMA_DIR)=$(SCHEMA_OUT))
ARTIFACTS := $(ARTIFACT_PATH:.capnp=.capnp.$(SCHEMA_LNG))

# all: $(ARTIFACTS)

$(ARTIFACTS): $(SCHEMAS)
	mkdir -p $(SCHEMA_OUT)
	$(SCHEMA_CMD) $^

.PHONY: clean

clean:
	rm -f $(SCHEMA_OUT)/*.$(SCHEMA_LNG) $(SCHEMA_OUT)/*.h
