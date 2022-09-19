@echo off

echo HEADER test

pushd sealed_class_annotations || exit 1
echo NOTE sealed_class_annotations
call dart test || exit 1
popd || exit 1

pushd sealed_class_writer || exit 1
echo NOTE sealed_class_writer
call dart test || exit 1
popd || exit 1

pushd sealed_class_creators || exit 1
echo NOTE sealed_class_creators
call dart test || exit 1
popd || exit 1

pushd example || exit 1
echo NOTE example
call dart test || exit 1
popd || exit 1
