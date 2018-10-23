load("//java:compile.bzl", "java_proto_compile", "java_grpc_compile")

def java_proto_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    java_proto_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )
    native.java_library(
        name = name,
        srcs = [name_pb],
        deps = ["@org_pubref_rules_proto//java:proto_deps"],
        exports = [
            "@org_pubref_rules_proto//java:proto_deps",
        ],
        visibility = visibility,
    )

def java_grpc_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    java_grpc_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )
    native.java_library(
        name = name,
        srcs = [name_pb],
        deps = ["@org_pubref_rules_proto//java:grpc_deps"],
        exports = [
            "@org_pubref_rules_proto//java:grpc_deps",
        ],
        visibility = visibility,
    )
