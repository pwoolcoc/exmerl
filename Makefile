MIX=$(shell which mix)
EXDOC=$(shell which ex_doc)
BUILD=_build
LIB=lib
DOCS=docs
EENV=dev
MODULE_NAME="Exmerl"
GITHUB="https://github.com/pwoolcoc/Exmerl"

TARGET=$(BUILD)/$(EENV)/lib/exmerl/ebin/exmerl.app

SOURCES=$(shell find $(LIB)/ -name "*.ex")

$(TARGET): $(SOURCES)
	$(MIX) compile

compile: $(TARGET)

$(DOCS)/index.html: $(TARGET)
	ex_doc $(MODULE_NAME) "0.1" $(shell dirname $(TARGET)) -m $(MODULE_NAME) -u "https://github.com/pwoolcoc/Exmerl"

docs: $(DOCS)/index.html $(EXDOC)

$(EXDOC):
	@ echo "ex_doc was not found on your path. Please install ex_doc from https://github.com/elixir-lang/ex_doc and make sure the executable is on your path
	@ false

serve: docs
	cd $(DOCS) && python -m SimpleHTTPServer

cli:
	iex -S mix

test: $(TARGET)
	$(MIX) test

clean:
	$(MIX) clean
	-rm -fr $(BUILD)
	-rm -fr $(DOCS)

.PHONY: cli test clean serve
