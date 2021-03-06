#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <erl_nif.h>
#include "monochrome32.h"
#include "monochrome32i.h"
#include "monochrome32ip.h"
#include "monochrome16.h"
#include "monochrome16i.h"

static ERL_NIF_TERM monochrome32_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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

    monochrome32(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ERL_NIF_TERM monochrome32i_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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

    monochrome32i(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ERL_NIF_TERM monochrome32ip_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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

    monochrome32ip(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ERL_NIF_TERM monochrome16_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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

    monochrome16(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ERL_NIF_TERM monochrome16i_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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

    monochrome16i(vec_size, in, out);

    return enif_make_binary(env, &out_data);
}

static ErlNifFunc nif_funcs[] = 
{
    {"monochrome32_nif", 2, monochrome32_nif},
    {"monochrome32i_nif", 2, monochrome32i_nif},
    {"monochrome32ip_nif", 2, monochrome32ip_nif},
    {"monochrome16_nif", 2, monochrome16_nif},
    {"monochrome16i_nif", 2, monochrome16i_nif},
};

ERL_NIF_INIT(Elixir.MonochromeFilterNif, nif_funcs, NULL, NULL, NULL, NULL)
