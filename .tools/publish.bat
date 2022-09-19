@echo off

echo HEADER publish

pushd sealed_class_annotations || exit 1
echo NOTE sealed_class_annotations
call dart pub publish || exit 1
popd || exit 1

pushd sealed_class_writer || exit 1
echo NOTE sealed_class_writer
call dart pub publish || exit 1
popd || exit 1

pushd sealed_class_creators || exit 1
echo NOTE sealed_class_creators
call dart pub publish || exit 1
popd || exit 1
