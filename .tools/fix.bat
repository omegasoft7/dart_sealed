@echo off

echo HEADER format

pushd sealed_class_annotations || exit 1
echo NOTE sealed_class_annotations
call dart format --fix lib test
popd || exit 1

pushd sealed_class_writer || exit 1
echo NOTE sealed_class_writer
call dart format --fix lib test
popd || exit 1

pushd sealed_class_creators || exit 1
echo NOTE sealed_class_creators
call dart format --fix lib test
popd || exit 1

pushd example || exit 1
echo NOTE example
call dart format --fix test
popd || exit 1
