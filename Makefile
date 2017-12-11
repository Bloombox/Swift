
#
## Bloombox: Swift API Client
#

SCHEMA ?= Schema/
SCHEMA_BRANCH ?= master
SWIFT_PROTOBUF ?= SwiftProtobuf
SWIFT_GRPC ?= SwiftGRPC

all: submodules schema build test
	@echo "Swift API client ready."

clean:
	@echo "Cleaning Swift client for Bloombox..."
	@rm -frv .build

build: dependencies
	@echo "Building Swift client for Bloombox..."
	@swift build

dependencies: swift-protobuf swift-grpc

test:
	@echo "Running tests..."
	@swift test

submodules: $(SCHEMA) $(SWIFT_PROTOBUF) $(SWIFT_GRPC)
	@git submodule update --init --remote

schema: $(SCHEMA) sync-schema

$(SCHEMA):
	@echo "Initializing Schema..."
	@git submodule add --force --name schema git@github.com:bloombox/Schema.git $(SCHEMA)

sync-schema: swift-protobuf swift-grpc
	@echo "Building Schema..."
	@$(MAKE) -C $(SCHEMA) LANGUAGES="swift swiftgrpc" PROTO_FLAGS="--plugin=$(PWD)/SwiftGRPC/Plugin/.build/x86_64-apple-macosx10.10/debug/protoc-gen-swiftgrpc --swiftgrpc_out=languages/swiftgrpc" SERVICES=yes TABLES=no
	@echo "Syncing Swift schemas..."
	@rm -fr Sources/Schema/*.swift
	@cp -fr $(SCHEMA)/languages/swift/* Sources/Schema/
	@echo "Schemas ready."

swift-protobuf:
	@echo "Building SwiftProtobuf..."
	@$(MAKE) -C $(SWIFT_PROTOBUF)

swift-grpc:
	@echo "Building SwiftGRPC..."
	@$(MAKE) -C $(SWIFT_GRPC)
	@$(MAKE) -C $(SWIFT_GRPC)/Plugin

$(SWIFT_PROTOBUF):
	@echo "Initializing SwiftProtobuf..."
	@git submodule add --force --name SwiftProtobuf git@github.com:apple/swift-protobuf.git $(SWIFT_PROTOBUF)

$(SWIFT_GRPC):
	@echo "Initializing SwiftGRPC..."
	@git submodule add --force --name SwiftGRPC git@github.com:grpc/grpc-swift.git $(SWIFT_GRPC)

