#ifndef HALIDE_CODEGEN_WEBASSEMBLY_H
#define HALIDE_CODEGEN_WEBASSEMBLY_H

/** \file
 * Defines the code-generator for producing WebAssembly machine code.
 */

#include "CodeGen_Posix.h"

namespace Halide {
namespace Internal {

/** A code generator that emits WebAssembly code from a given Halide stmt. */
class CodeGen_WebAssembly : public CodeGen_Posix {
public:
    CodeGen_WebAssembly(Target);

    static void test();

protected:
    std::string mcpu() const override;
    std::string mattrs() const override;
    bool use_soft_float_abi() const override;
    int native_vector_bits() const override;
};

}}

#endif
