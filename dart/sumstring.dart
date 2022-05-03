import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef Cfunc = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef Dartfunc = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);

int main() {

  print("Opening.....");
  final lib = DynamicLibrary.open('../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so');

  print("Associating.....");
  Pointer<NativeFunction<Cfunc>> csumstring = lib.lookup<NativeFunction<Cfunc>>('sumstring');
  Dartfunc sumstring = csumstring.asFunction<Dartfunc>();

  print("Calling.....");
  final result = sumstring ('Hello '.toNativeUtf8(), 'world'.toNativeUtf8());
    if (result.toDartString() == 'Hello world')
    {
        print("Hoorah! the result is ${result.toDartString()}, this is correct");
    }
    else
    {
        print("Oops something is wrong the result is ${result.toDartString()}");
    }

 return 0;
   
}