#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <erl_nif.h>
#include "cv_monochrome.h"

static ERL_NIF_TERM cv_monochrome_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    if(__builtin_expect(argc != 2, false)) {
        return enif_make_badarg(env);
    }
    ErlNifUInt64 vec_size;
    if(__builtin_expect(!enif_get_uint64(env, argv[0], &vec_size), false)) {
        return enif_make_badarg(env);
    }

    ERL_NIF_TERM binary_term = argv[1];
    ErlNifBinary in_data;
    if(__builtin_expect(!enif_inspect_binary(env, binary_term, &in_data), false)) {
        return enif_make_badarg(env);
    }

    uint8_t *in = (uint8_t *)in_data.data;
    ErlNifBinary out_data;
    if(__builtin_expect(!enif_alloc_binary(vec_size * sizeof(uint8_t) * 3, &out_data), false)) {
        return enif_make_badarg(env);
    }
    uint8_t *out = (uint8_t *)out_data.data;

    cv_monochrome(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ErlNifFunc nif_funcs[] =
{
	{"cv_monochrome_nif", 2, cv_monochrome_nif}
};

ERL_NIF_INIT(Elixir.CvMonochrome, nif_funcs, NULL, NULL, NULL, NULL)
