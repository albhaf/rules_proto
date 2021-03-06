load("//:compile.bzl", "proto_compile")

def java_proto_compile(**kwargs):
    proto_compile(
        plugins = [str(Label("//java:java"))],
        **kwargs
    )

def java_grpc_compile(**kwargs):
    proto_compile(
        plugins = [str(Label("//java:java")), str(Label("//java:grpc_java"))],
        **kwargs
    )

