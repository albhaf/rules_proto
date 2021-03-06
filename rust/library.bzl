load("//rust:compile.bzl", "rust_proto_compile", "rust_grpc_compile")
load("//rust:rust_proto_lib.bzl", "rust_proto_lib")
load("@io_bazel_rules_rust//rust:rust.bzl", "rust_library")

def rust_proto_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    name_lib = name + "_lib"

    rust_proto_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )
    rust_proto_lib(
        name = name_lib,
        compilation = name_pb,
    )
    rust_library(
        name = name,
        srcs = [name_pb, name_lib],
        deps = [
            str(Label("//rust/cargo:protobuf")),
        ],
        visibility = visibility,
    )

def rust_grpc_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    name_lib = name + "_lib"

    rust_grpc_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )

    rust_proto_lib(
        name = name_lib,
        compilation = name_pb,
    )

    rust_library(
        name = name,
        srcs = [name_pb, name_lib],
        deps = [
            str(Label("//rust/cargo:protobuf")),
            str(Label("//rust/cargo:grpc")),
            str(Label("//rust/cargo:tls_api")),
            str(Label("//rust/cargo:tls_api_stub")),
        ],
        visibility = visibility,
    )
