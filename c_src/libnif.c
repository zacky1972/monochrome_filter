#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <erl_nif.h>

void monochrome32(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint8_t *pin = in;
    uint8_t *pout = out;
    for(u_int64_t i = 0; i < size; i++) {
        uint8_t r = *pin++;
        uint8_t g = *pin++;
        uint8_t b = *pin++;
        uint8_t m = r * 0.399f + g * 0.587f + b * 0.114f;
        *pout++ = m;
        *pout++ = m;
        *pout++ = m;
    }
}

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

static ErlNifFunc nif_funcs[] = 
{
    {"monochrome32_nif", 2, monochrome32_nif},
};

ERL_NIF_INIT(Elixir.MonochromeFilterNif, nif_funcs, NULL, NULL, NULL, NULL)
